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

import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.CustomerSupport;
import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.Order;
import com.lotut.pms.domain.PatentDoc;
import com.lotut.pms.domain.PatentDocOrder;
import com.lotut.pms.domain.ProxyOrg;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.AppPersonService;
import com.lotut.pms.service.EmployeeService;
import com.lotut.pms.service.FriendService;
import com.lotut.pms.service.InventorService;
import com.lotut.pms.service.PatentDocService;
import com.lotut.pms.service.PatentDocWorkflowService;
import com.lotut.pms.service.PatentDocumentTemplateService;
import com.lotut.pms.service.PetitionService;
import com.lotut.pms.service.UserService;
import com.lotut.pms.util.PrincipalUtils;
import com.mysql.fabric.xmlrpc.base.Array;


@Controller
@RequestMapping(path="/patentDocWorkflow")
public class PatentDocWorkflowController {
	private PatentDocWorkflowService patentDocWorkflowService;
	private PatentDocService patentDocService;
	private InventorService inventorService ;
	private AppPersonService appPersonService;
	private UserService userService;
	private FriendService friendService;
	private PetitionService petitionService;
	private EmployeeService employeeService;
	
	
	@Autowired
	public PatentDocWorkflowController(PatentDocService patentDocService,InventorService inventorService,AppPersonService appPersonService,FriendService friendService,PetitionService petitionService,UserService userService,PatentDocWorkflowService patentDocWorkflowService,EmployeeService employeeService) {
		this.patentDocService = patentDocService;
		this.inventorService = inventorService;
		this.appPersonService = appPersonService;
		this.friendService = friendService;
		this.petitionService = petitionService;
		this.userService= userService;
		this.patentDocWorkflowService =patentDocWorkflowService;
		this.employeeService=employeeService;
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
		int parentOrgId = employeeService.getParentOrgIdByUserId(PrincipalUtils.getCurrentUserId());
		List<ProxyOrg> proxyOrgs = employeeService.getProxyOrgList(parentOrgId);
		model.addAttribute("proxyOrgs", proxyOrgs);
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
		final int PATENT_DOC_STAUTS_PAID = 3;
		patentDocWorkflowService.updatePatentDocStatus(patentDocIdList, PATENT_DOC_STAUTS_PAID);
		return "patent_doc_list";
	}
	
	@RequestMapping(path="/showCustomerSupports", method=RequestMethod.GET)//客服
	public String getCustomerSupportList(Model model) {
		int proxyOrgId = PrincipalUtils.getCurrentUserId(); 
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
		final int PATENT_DOC_STAUTS_PAID = 4;
		patentDocWorkflowService.updatePatentDocStatus(patentDocIdList, PATENT_DOC_STAUTS_PAID);
		return "patent_doc_list";
	}
}