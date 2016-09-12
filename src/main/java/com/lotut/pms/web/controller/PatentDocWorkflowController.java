package com.lotut.pms.web.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.constants.PatentDocWorkflowAction;
import com.lotut.pms.domain.CustomerSupport;
import com.lotut.pms.domain.PatentDoc;
import com.lotut.pms.domain.PatentDocOrder;
import com.lotut.pms.domain.ProcessPerson;
import com.lotut.pms.domain.ProxyOrg;
import com.lotut.pms.domain.TechPerson;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.EmployeeService;
import com.lotut.pms.service.PatentDocService;
import com.lotut.pms.service.PatentDocWorkflowHistoryService;
import com.lotut.pms.service.PatentDocWorkflowService;
import com.lotut.pms.util.PrincipalUtils;


@Controller
@RequestMapping(path="/patentDocWorkflow")
public class PatentDocWorkflowController {
	private PatentDocWorkflowService patentDocWorkflowService;
	private PatentDocService patentDocService;
	private EmployeeService employeeService;
	private PatentDocWorkflowHistoryService patentDocWorkflowHistoryService;
	
	
	@Autowired
	public PatentDocWorkflowController(PatentDocWorkflowService patentDocWorkflowService,
			PatentDocService patentDocService, EmployeeService employeeService,
			PatentDocWorkflowHistoryService patentDocWorkflowHistoryService) {
		this.patentDocWorkflowService = patentDocWorkflowService;
		this.patentDocService = patentDocService;
		this.employeeService = employeeService;
		this.patentDocWorkflowHistoryService = patentDocWorkflowHistoryService;
	}

	
	@RequestMapping(path="/createOrderForm")
	public String creatOrder(@RequestParam("patentDocIds")List<Long> patentDocIds,Model model){
			List<PatentDoc> patentDocs = patentDocService.getPatentDocsByIds(patentDocIds);
			List<PatentDoc> resultPatentDoc=new ArrayList<PatentDoc>();
		 	Map<Integer,Integer> priceTab=new HashMap<Integer,Integer>();
		 	priceTab.put(1, 100);
		 	priceTab.put(2, 200);
		 	priceTab.put(3, 300);
			int totalAmount=0;
			for(PatentDoc patentDoc:patentDocs){
				 int patentType=patentDoc.getPatentType();
				patentDoc.setPrice(priceTab.get(patentType));
				totalAmount+=priceTab.get(patentType);
				 resultPatentDoc.add(patentDoc);
			}
	
			model.addAttribute("PatentDocs", resultPatentDoc);
			model.addAttribute("totalAmount", totalAmount);
			return "patent_doc_order_create_form";
}
	
	
	@RequestMapping(path="/createPatentDocOrder")
	public String createOrder(@RequestParam("patentDocIds")Long[] patentDocIds, @ModelAttribute @Valid PatentDocOrder order, Model model) {
		final int ALIPAY = 1;
		User user = PrincipalUtils.getCurrentPrincipal();
		order.setOwner(user);
		List<PatentDoc> PatentDocs = patentDocService.getPatentDocsByIds(Arrays.asList(patentDocIds));
		patentDocWorkflowService.createOrder(order, PatentDocs);
		model.addAttribute("orderId", order.getId());
		model.addAttribute("patentDocIds",patentDocIds);
		if (order.getPaymentMethod().getPaymentMethodId() == ALIPAY) {
			return "redirect:/patentDocAlipay/pay.html";
		}
		
		return "add_patent_success";
	}
	
	@RequestMapping(path="showProxyOrgs", method=RequestMethod.GET)
	public String showFriends(Model model) {
		if(PrincipalUtils.isPlatform()) {
			List<ProxyOrg> proxyOrgs = employeeService.getTopProxyOrgList();
			model.addAttribute("proxyOrgs", proxyOrgs);
		}
		if(PrincipalUtils.isProxyOrg()){
			int parentOrgId = employeeService.getOrgIdByUserId(PrincipalUtils.getCurrentUserId());
			List<ProxyOrg> proxyOrgs = employeeService.getProxyOrgList(parentOrgId);
			model.addAttribute("proxyOrgs", proxyOrgs);
		}
		
		return "patent_doc_select_proxy_org";
	}
	
	@RequestMapping(path="/addProxyOrgShares", method=RequestMethod.GET)
	public String addProxyOrgShares(@RequestParam("patentDocIds")List<Integer> patentDocIds, @RequestParam("proxyOrgs")List<Integer> proxyOrgs) {
		List<Map<String, Integer>> userPatentDocRecords = new ArrayList<>();
		List<Long> patentDocIdList=new ArrayList<>();
		for (int patentDocId: patentDocIds) {
			for (int proxyOrg: proxyOrgs) {
				Map<String, Integer> userPatentRecord =  new HashMap<String, Integer>();
				userPatentRecord.put("userId", proxyOrg);
				userPatentRecord.put("patentDocId", patentDocId);
				userPatentDocRecords.add(userPatentRecord);
			}
			patentDocIdList.add(Long.valueOf(patentDocId));
		}
		patentDocService.insertUserPatentDoc(userPatentDocRecords);
		final int PATENT_DOC_STAUTS_PAID = 2;
		final int PATENT_DOC_PROXY_STAUTS_PAID = 3;
		patentDocWorkflowService.updatePatentDocStatus(patentDocIdList, PATENT_DOC_STAUTS_PAID);
		patentDocWorkflowService.updatePatentDocProxyStatus(patentDocIdList,PATENT_DOC_PROXY_STAUTS_PAID);
		int action=PatentDocWorkflowAction.ActionType.get("分配给代理机构");
		patentDocWorkflowHistoryService.insertHistoriesAndWorkflowTargets(patentDocIds, proxyOrgs, action);
		return "patent_doc_list";
	}
	
	@RequestMapping(path="/showCustomerSupports", method=RequestMethod.GET)//客服
	public String getCustomerSupportList(Model model) {
		int proxyOrgId = employeeService.getOrgIdByUserId(PrincipalUtils.getCurrentUserId());
		List<CustomerSupport> customerSupports = employeeService.getCustomerSupportList(proxyOrgId);
		model.addAttribute("customerSupports", customerSupports);
		return "patent_doc_select_customer_support";
	}
	
	@RequestMapping(path="/addCustomerSupportShares", method=RequestMethod.GET)
	public String addCustomerSupportShares(@RequestParam("patentDocIds")List<Integer> patentDocIds, @RequestParam("customerSuppors")List<Integer> customerSuppors) {
		List<Map<String, Integer>> userPatentDocRecords = new ArrayList<>();
		List<Long> patentDocIdList=new ArrayList<>();
		for (int patentDocId: patentDocIds) {
			for (int customerSuppor: customerSuppors) {
				Map<String, Integer> userPatentRecord =  new HashMap<String, Integer>();
				userPatentRecord.put("userId", customerSuppor);
				userPatentRecord.put("patentDocId", patentDocId);
				userPatentDocRecords.add(userPatentRecord);
			}
			patentDocIdList.add(Long.valueOf(patentDocId));
		}
		patentDocService.insertUserPatentDoc(userPatentDocRecords);
		final int PATENT_DOC_STAUTS_PAID = 3;
		patentDocWorkflowService.updatePatentDocStatus(patentDocIdList, PATENT_DOC_STAUTS_PAID);
		int action=PatentDocWorkflowAction.ActionType.get("分配给客服人员");
		patentDocWorkflowHistoryService.insertHistoriesAndWorkflowTargets(patentDocIds, customerSuppors, action);
		return "patent_doc_list";
	}
	
	
	@RequestMapping(path="/showTechPersons", method=RequestMethod.GET)//技术员
	public String showTechPersons(Model model) {
		int proxyOrgId = employeeService.getOrgIdByCustomerSupportId(PrincipalUtils.getCurrentUserId());
		List<TechPerson> techPersons = employeeService.getTechPersonList(proxyOrgId);
		model.addAttribute("techPersons", techPersons);
		return "patent_doc_select_tech_person";
	}
	
	@RequestMapping(path="/addTechPersonShares", method=RequestMethod.GET)
	public String addTechPersonShares(@RequestParam("patentDocIds")List<Integer> patentDocIds, @RequestParam("techPersons")List<Integer> techPersons) {
		List<Map<String, Integer>> userPatentDocRecords = new ArrayList<>();
		List<Long> patentDocIdList=new ArrayList<>();
		for (int patentDocId: patentDocIds) {
			for (int techPerson: techPersons) {
				Map<String, Integer> userPatentRecord =  new HashMap<String, Integer>();
				userPatentRecord.put("userId", techPerson);
				userPatentRecord.put("patentDocId", patentDocId);
				userPatentDocRecords.add(userPatentRecord);
			}
			patentDocIdList.add(Long.valueOf(patentDocId));
		}
		patentDocService.insertUserPatentDoc(userPatentDocRecords);
		final int PATENT_DOC_STAUTS_PAID = 4;
		patentDocWorkflowService.updatePatentDocStatus(patentDocIdList, PATENT_DOC_STAUTS_PAID);
		int action=PatentDocWorkflowAction.ActionType.get("分配给技术员");
		patentDocWorkflowHistoryService.insertHistoriesAndWorkflowTargets(patentDocIds, techPersons, action);
		return "patent_doc_list";
	}
	
	
	@RequestMapping(path="/showProcessPersons", method=RequestMethod.GET)//流程
	public String showProcessPersons(Model model) {
		int proxyOrgId = employeeService.getOrgIdByCustomerSupportId(PrincipalUtils.getCurrentUserId());
		List<ProcessPerson> processPersons = employeeService.getProcessPersonList(proxyOrgId);
		model.addAttribute("processPersons", processPersons);
		return "patent_doc_select_process_person";
	}
	
	@RequestMapping(path="/addProcessPersonShares", method=RequestMethod.GET)
	public String addProcessPersonShares(@RequestParam("patentDocIds")List<Integer> patentDocIds, @RequestParam("processPersons")List<Integer> processPersons) {
		List<Map<String, Integer>> userPatentDocRecords = new ArrayList<>();
		List<Long> patentDocIdList=new ArrayList<>();
		for (int patentDocId: patentDocIds) {
			for (int processPerson: processPersons) {
				Map<String, Integer> userPatentRecord =  new HashMap<String, Integer>();
				userPatentRecord.put("userId", processPerson);
				userPatentRecord.put("patentDocId", patentDocId);
				userPatentDocRecords.add(userPatentRecord);
			}
			patentDocIdList.add(Long.valueOf(patentDocId));
		}
		patentDocService.insertUserPatentDoc(userPatentDocRecords);
		final int PATENT_DOC_STAUTS_PAID = 9;
		patentDocWorkflowService.updatePatentDocStatus(patentDocIdList, PATENT_DOC_STAUTS_PAID);
		int insertAction =PatentDocWorkflowAction.ActionType.get("置为待交局");
		patentDocWorkflowHistoryService.insertActionHistories(patentDocIds, insertAction);
		int shareAction=PatentDocWorkflowAction.ActionType.get("分配给流程人员");
		patentDocWorkflowHistoryService.insertHistoriesAndWorkflowTargets(patentDocIds, processPersons, shareAction);
		return "patent_doc_list";
	}
	
	
	@RequestMapping(path="/updatePatentDocStatus", method=RequestMethod.GET)
	public String updatePatentDocStatus(@RequestParam("patentDocId") Long patentdocId,@RequestParam("status")int status,Model model) {
		List<Long> patentDocIdList=new ArrayList<>();
		patentDocIdList.add(patentdocId);
		patentDocWorkflowService.updatePatentDocStatus(patentDocIdList, status);
		int action=0;
		if(status==6){
			 action=13;}
		if(status==7){
			 action=5;}
		if(status==8){
		 action=7;}
		if(status==9){
			 action=8;}
		if(status==10){
			 action=14;}
		if(status==11){
			 action=10;}
		patentDocWorkflowHistoryService.insertHistory(patentdocId.intValue(), action);
		return "redirect:/editor/patentDocList.html";
	}
	
	@RequestMapping(path="/searchProxyOrg", method=RequestMethod.GET)
	public String searchProxyOrg(String keyword,Model model) {
		int proxyOrgId = PrincipalUtils.getCurrentUserId();
		String loginRole="";
		if(PrincipalUtils.isPlatform()){
			loginRole="platForm";
		}else if(PrincipalUtils.isProxyOrg()){
			loginRole="proxyOrg";
		}
		List<ProxyOrg> proxyOrgs=employeeService.searchProxyOrgId(keyword,proxyOrgId,loginRole);
		model.addAttribute("proxyOrgs", proxyOrgs);
		return "patent_doc_select_proxy_org";
	}
	
	@RequestMapping(path="/searchCustomers", method=RequestMethod.GET)
	public String searchCustomers(String keyword,Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<CustomerSupport> customerSupports=employeeService.searchCustomersByProxyId(keyword, userId);
		model.addAttribute("customerSupports", customerSupports);
		return "patent_doc_select_customer_support";
	}
	
	@RequestMapping(path="/searchTechPerson", method=RequestMethod.GET)
	public String searchTechPerson(String keyword,Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<TechPerson> techPersons=employeeService.searchTechPersonByProxyId(keyword, userId);
		model.addAttribute("techPersons", techPersons);
		return "patent_doc_select_tech_person";
	}
	
	@RequestMapping(path="/searchProcessPerson", method=RequestMethod.GET)
	public String searchProcessPerson(String keyword,Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<ProcessPerson> processPersons=employeeService.searchProcessPersonByProxyId(keyword, userId);
		model.addAttribute("processPersons", processPersons);
		return "patent_doc_select_process_person";
	}
	
	@RequestMapping(path="/redistributeProxyOrgShares")
	public String redistributePatentDoc(@RequestParam("patentDocIds")List<Integer> patentDocIds, @RequestParam("proxyOrgs")List<Integer> proxyOrgs){
		List<Long> patentDocIdList=new ArrayList<>();
			patentDocIdList.add(Long.valueOf(patentDocIds.get(0)));
		int action=PatentDocWorkflowAction.ActionType.get("分配给代理机构");
		patentDocWorkflowService.redistributePatentDoc(patentDocIds.get(0), action, proxyOrgs.get(0));
		final int PATENT_DOC_STAUTS_PAID = 2;
		patentDocWorkflowService.updatePatentDocStatus(patentDocIdList, PATENT_DOC_STAUTS_PAID);
		patentDocWorkflowHistoryService.insertHistoriesAndWorkflowTargets(patentDocIds, proxyOrgs, action);
		return "patent_doc_list";
	}
	
	@RequestMapping(path="/redistributeCustomerSupportShares")
	public String redistributeCustomerSupportShares(@RequestParam("patentDocIds")List<Integer> patentDocIds, @RequestParam("customerSuppors")List<Integer> customerSuppors){
		List<Long> patentDocIdList=new ArrayList<>();
			patentDocIdList.add(Long.valueOf(patentDocIds.get(0)));
		int action=PatentDocWorkflowAction.ActionType.get("分配给客服人员");
		patentDocWorkflowService.redistributePatentDoc(patentDocIds.get(0), action, customerSuppors.get(0));
		final int PATENT_DOC_STAUTS_PAID = 3;
		patentDocWorkflowService.updatePatentDocStatus(patentDocIdList, PATENT_DOC_STAUTS_PAID);
		patentDocWorkflowHistoryService.insertHistoriesAndWorkflowTargets(patentDocIds, customerSuppors, action);
		return "patent_doc_list";
	}
	
	@RequestMapping(path="/redistributeTechPersonShares")
	public String redistributeTechPersonShares(@RequestParam("patentDocIds")List<Integer> patentDocIds, @RequestParam("techPersons")List<Integer> techPersons){
		List<Long> patentDocIdList=new ArrayList<>();
			patentDocIdList.add(Long.valueOf(patentDocIds.get(0)));
		int action=PatentDocWorkflowAction.ActionType.get("分配给技术员");
		patentDocWorkflowService.redistributePatentDoc(patentDocIds.get(0), action, techPersons.get(0));
		final int PATENT_DOC_STAUTS_PAID = 4;
		patentDocWorkflowService.updatePatentDocStatus(patentDocIdList, PATENT_DOC_STAUTS_PAID);
		patentDocWorkflowHistoryService.insertHistoriesAndWorkflowTargets(patentDocIds, techPersons, action);
		return "patent_doc_list";
	}
	
	@RequestMapping(path="/redistributeProcessPersonShares")
	public String redistributeProcessPersonShares(@RequestParam("patentDocIds")List<Integer> patentDocIds, @RequestParam("processPersons")List<Integer> processPersons){
		List<Long> patentDocIdList=new ArrayList<>();
			patentDocIdList.add(Long.valueOf(patentDocIds.get(0)));
			int shareAction=PatentDocWorkflowAction.ActionType.get("分配给流程人员");
			int insertAction =PatentDocWorkflowAction.ActionType.get("置为待交局");
			patentDocWorkflowHistoryService.insertActionHistories(patentDocIds, insertAction);
		patentDocWorkflowService.redistributePatentDoc(patentDocIds.get(0), shareAction, processPersons.get(0));
		final int PATENT_DOC_STAUTS_PAID = 9;
		patentDocWorkflowService.updatePatentDocStatus(patentDocIdList, PATENT_DOC_STAUTS_PAID);
		patentDocWorkflowHistoryService.insertHistoriesAndWorkflowTargets(patentDocIds, processPersons, shareAction);
		return "patent_doc_list";
	}
	
	@RequestMapping(path="/updatePatentDocProxyStatus", method=RequestMethod.GET)
	public String updatePatentDocProxyStatus(@RequestParam("patentDocId") Long patentdocId,@RequestParam("status")int status) {
		List<Long> patentDocIdList=new ArrayList<>();
		patentDocIdList.add(patentdocId);
		patentDocWorkflowService.updatePatentDocProxyStatus(patentDocIdList, status);
		return "redirect:/editor/patentDocList.html";
	}
	
	@RequestMapping(path="showRedistributeProxyOrgs", method=RequestMethod.GET)
	public String showredistributeProxyOrgs(Model model) {
		if(PrincipalUtils.isPlatform()) {
			List<ProxyOrg> proxyOrgs = employeeService.getTopProxyOrgList();
			model.addAttribute("proxyOrgs", proxyOrgs);
		}
		if(PrincipalUtils.isProxyOrg()){
			int parentOrgId = employeeService.getOrgIdByUserId(PrincipalUtils.getCurrentUserId());
			List<ProxyOrg> proxyOrgs = employeeService.getProxyOrgList(parentOrgId);
			model.addAttribute("proxyOrgs", proxyOrgs);
		}
		
		return "patent_doc_redistribute_select_proxy_org";
	}
	
	@RequestMapping(path="/showRedistributeCustomerSupports", method=RequestMethod.GET)//客服
	public String showRedistributeCustomerSupports(Model model) {
		int proxyOrgId = employeeService.getOrgIdByUserId(PrincipalUtils.getCurrentUserId());
		List<CustomerSupport> customerSupports = employeeService.getCustomerSupportList(proxyOrgId);
		model.addAttribute("customerSupports", customerSupports);
		return "patent_doc_redistribute_select_customer_support";
	}

	@RequestMapping(path="/showRedistributeTechPersons", method=RequestMethod.GET)//技术员
	public String showRedistributeTechPersons(Model model) {
		int proxyOrgId = employeeService.getOrgIdByCustomerSupportId(PrincipalUtils.getCurrentUserId());
		List<TechPerson> techPersons = employeeService.getTechPersonList(proxyOrgId);
		model.addAttribute("techPersons", techPersons);
		return "patent_doc_redistribute_select_tech_person";
	}
	
	@RequestMapping(path="/showRedistributeProcessPersons", method=RequestMethod.GET)//流程
	public String showRedistributeProcessPersons(Model model) {
		int proxyOrgId = employeeService.getOrgIdByCustomerSupportId(PrincipalUtils.getCurrentUserId());
		List<ProcessPerson> processPersons = employeeService.getProcessPersonList(proxyOrgId);
		model.addAttribute("processPersons", processPersons);
		return "patent_doc_redistribute_select_process_person";
	}
	
}