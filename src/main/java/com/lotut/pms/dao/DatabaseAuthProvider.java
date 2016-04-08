package com.lotut.pms.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.context.ApplicationContextException;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityMessageSource;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.util.Assert;

import com.lotut.pms.domain.User;

public class DatabaseAuthProvider extends JdbcDaoSupport implements UserDetailsService {

	public static final String DEF_USERS_BY_USERNAME_QUERY = "select user_id,username,password,enabled,name,email,join_date "
			+ "from users " + "where username = ?";
	public static final String DEF_AUTHORITIES_BY_USERNAME_QUERY = "select username,authority "
			+ "from authorities " + "where username = ?";
	public static final String DEF_GROUP_AUTHORITIES_BY_USERNAME_QUERY = "select g.id, g.group_name, ga.authority "
			+ "from groups g, group_members gm, group_authorities ga "
			+ "where gm.username = ? "
			+ "and g.id = ga.group_id "
			+ "and g.id = gm.group_id";

	// ~ Instance fields
	// ================================================================================================

	protected final MessageSourceAccessor messages = SpringSecurityMessageSource
			.getAccessor();

	private String authoritiesByUsernameQuery;
	private String groupAuthoritiesByUsernameQuery;
	private String usersByUsernameQuery;
	private String rolePrefix = "";
	private boolean usernameBasedPrimaryKey = true;
	private boolean enableAuthorities = false;
	private boolean enableGroups = true;

	// ~ Constructors
	// ===================================================================================================

	public DatabaseAuthProvider() {
		usersByUsernameQuery = DEF_USERS_BY_USERNAME_QUERY;
		authoritiesByUsernameQuery = DEF_AUTHORITIES_BY_USERNAME_QUERY;
		groupAuthoritiesByUsernameQuery = DEF_GROUP_AUTHORITIES_BY_USERNAME_QUERY;
	}

	// ~ Methods
	// ========================================================================================================


	protected void addCustomAuthorities(String username,
			List<GrantedAuthority> authorities) {
	}

	public String getUsersByUsernameQuery() {
		return usersByUsernameQuery;
	}

	protected void initDao() throws ApplicationContextException {
		Assert.isTrue(enableAuthorities || enableGroups,
				"Use of either authorities or groups must be enabled");
	}

	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		List<User> users = loadUsersByUsername(username);

		if (users.size() == 0) {
			logger.debug("Query returned no results for user '" + username + "'");

			throw new UsernameNotFoundException(messages.getMessage(
					"JdbcDaoImpl.notFound", new Object[] { username },
					"Username {0} not found"));
		}

		User user = users.get(0); // contains no GrantedAuthority[]

		Set<GrantedAuthority> dbAuthsSet = new HashSet<GrantedAuthority>();

		if (enableAuthorities) {
			dbAuthsSet.addAll(loadUserAuthorities(user.getUsername()));
		}

		if (enableGroups) {
			dbAuthsSet.addAll(loadGroupAuthorities(user.getUsername()));
		}

		List<GrantedAuthority> dbAuths = new ArrayList<GrantedAuthority>(dbAuthsSet);
		
		addCustomAuthorities(user.getUsername(), dbAuths);

		if (dbAuths.size() == 0) {
			logger.debug("User '" + username
					+ "' has no authorities and will be treated as 'not found'");

			throw new UsernameNotFoundException(messages.getMessage(
					"JdbcDaoImpl.noAuthority", new Object[] { username },
					"User {0} has no GrantedAuthority"));
		}

		return createUser(user, dbAuths);
	}
	
	protected User createUser(User user, List<GrantedAuthority> combinedAuthorities) {
		return new User(user.getUserId(), user.getUsername(), user.getPassword(), user.isEnabled(), 
				user.getName(), user.getEmail(), user.getPhone(), user.getJoinDate(), combinedAuthorities);
	}

	/**
	 * Executes the SQL <tt>usersByUsernameQuery</tt> and returns a list of UserDetails
	 * objects. There should normally only be one matching user.
	 */
	protected List<User> loadUsersByUsername(String username) {
		return getJdbcTemplate().query(usersByUsernameQuery, new String[] { username },
				new RowMapper<User>() {
					public User mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						int userId = rs.getInt(1);
						String username = rs.getString(2);
						String password = rs.getString(3);
						boolean enabled = rs.getBoolean(4);
						String name = rs.getString(5);
						String email = rs.getString(6);
						Date joinDate = rs.getDate(7);
						String phone = rs.getString(8);
						
						return new User(userId, username, password, enabled, name, email, phone, joinDate,
								AuthorityUtils.NO_AUTHORITIES);
					}

				});
	}

	/**
	 * Loads authorities by executing the SQL from <tt>authoritiesByUsernameQuery</tt>.
	 *
	 * @return a list of GrantedAuthority objects for the user
	 */
	protected List<GrantedAuthority> loadUserAuthorities(String username) {
		return getJdbcTemplate().query(authoritiesByUsernameQuery,
				new String[] { username }, new RowMapper<GrantedAuthority>() {
					public GrantedAuthority mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						String roleName = rolePrefix + rs.getString(2);

						return new SimpleGrantedAuthority(roleName);
					}
				});
	}

	/**
	 * Loads authorities by executing the SQL from
	 * <tt>groupAuthoritiesByUsernameQuery</tt>.
	 *
	 * @return a list of GrantedAuthority objects for the user
	 */
	protected List<GrantedAuthority> loadGroupAuthorities(String username) {
		return getJdbcTemplate().query(groupAuthoritiesByUsernameQuery,
				new String[] { username }, new RowMapper<GrantedAuthority>() {
					public GrantedAuthority mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						String roleName = getRolePrefix() + rs.getString(3);

						return new SimpleGrantedAuthority(roleName);
					}
				});
	}


	/**
	 * Allows the default query string used to retrieve authorities based on username to
	 * be overridden, if default table or column names need to be changed. The default
	 * query is {@link #DEF_AUTHORITIES_BY_USERNAME_QUERY}; when modifying this query,
	 * ensure that all returned columns are mapped back to the same column names as in the
	 * default query.
	 *
	 * @param queryString The SQL query string to set
	 */
	public void setAuthoritiesByUsernameQuery(String queryString) {
		authoritiesByUsernameQuery = queryString;
	}

	protected String getAuthoritiesByUsernameQuery() {
		return authoritiesByUsernameQuery;
	}

	/**
	 * Allows the default query string used to retrieve group authorities based on
	 * username to be overridden, if default table or column names need to be changed. The
	 * default query is {@link #DEF_GROUP_AUTHORITIES_BY_USERNAME_QUERY}; when modifying
	 * this query, ensure that all returned columns are mapped back to the same column
	 * names as in the default query.
	 *
	 * @param queryString The SQL query string to set
	 */
	public void setGroupAuthoritiesByUsernameQuery(String queryString) {
		groupAuthoritiesByUsernameQuery = queryString;
	}

	/**
	 * Allows a default role prefix to be specified. If this is set to a non-empty value,
	 * then it is automatically prepended to any roles read in from the db. This may for
	 * example be used to add the <tt>ROLE_</tt> prefix expected to exist in role names
	 * (by default) by some other Spring Security classes, in the case that the prefix is
	 * not already present in the db.
	 *
	 * @param rolePrefix the new prefix
	 */
	public void setRolePrefix(String rolePrefix) {
		this.rolePrefix = rolePrefix;
	}

	protected String getRolePrefix() {
		return rolePrefix;
	}

	/**
	 * If <code>true</code> (the default), indicates the
	 * {@link #getUsersByUsernameQuery()} returns a username in response to a query. If
	 * <code>false</code>, indicates that a primary key is used instead. If set to
	 * <code>true</code>, the class will use the database-derived username in the returned
	 * <code>UserDetails</code>. If <code>false</code>, the class will use the
	 * {@link #loadUserByUsername(String)} derived username in the returned
	 * <code>UserDetails</code>.
	 *
	 * @param usernameBasedPrimaryKey <code>true</code> if the mapping queries return the
	 * username <code>String</code>, or <code>false</code> if the mapping returns a
	 * database primary key.
	 */
	public void setUsernameBasedPrimaryKey(boolean usernameBasedPrimaryKey) {
		this.usernameBasedPrimaryKey = usernameBasedPrimaryKey;
	}

	protected boolean isUsernameBasedPrimaryKey() {
		return usernameBasedPrimaryKey;
	}

	/**
	 * Allows the default query string used to retrieve users based on username to be
	 * overridden, if default table or column names need to be changed. The default query
	 * is {@link #DEF_USERS_BY_USERNAME_QUERY}; when modifying this query, ensure that all
	 * returned columns are mapped back to the same column names as in the default query.
	 * If the 'enabled' column does not exist in the source database, a permanent true
	 * value for this column may be returned by using a query similar to
	 * 
	 * <pre>
	 * &quot;select username,password,'true' as enabled from users where username = ?&quot;
	 * </pre>
	 *
	 * @param usersByUsernameQueryString The query string to set
	 */
	public void setUsersByUsernameQuery(String usersByUsernameQueryString) {
		this.usersByUsernameQuery = usersByUsernameQueryString;
	}

	protected boolean getEnableAuthorities() {
		return enableAuthorities;
	}

	/**
	 * Enables loading of authorities (roles) from the authorities table. Defaults to true
	 */
	public void setEnableAuthorities(boolean enableAuthorities) {
		this.enableAuthorities = enableAuthorities;
	}

	protected boolean getEnableGroups() {
		return enableGroups;
	}

	/**
	 * Enables support for group authorities. Defaults to false
	 * @param enableGroups
	 */
	public void setEnableGroups(boolean enableGroups) {
		this.enableGroups = enableGroups;
	}	
}
