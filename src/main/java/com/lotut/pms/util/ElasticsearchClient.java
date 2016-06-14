package com.lotut.pms.util;

import java.io.IOException;
import java.util.Properties;

import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.ImmutableSettings;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;

@SuppressWarnings("resource")
public class ElasticsearchClient {
	private static Settings settings;
	private static Client client;
	private static Properties props = new Properties();
	
	private ElasticsearchClient() {}

	static {
		try {
			props.load(Thread.currentThread().getContextClassLoader()
					.getResourceAsStream("config/elasticsearch.properties"));
			settings = ImmutableSettings.settingsBuilder()
					.put("cluster.name", props.getProperty("cluster.name"))
					.build();
			client = new TransportClient(settings)
					.addTransportAddress(new InetSocketTransportAddress(props.getProperty("host"), 9300));
		} catch (IOException e) {
			throw new RuntimeException("Cannot find config/elasticsearch.properties file.");
		}
	}

	public static Client getClient() {
		return client;
	}

	public static void close() {
		client.close();
	}
}
