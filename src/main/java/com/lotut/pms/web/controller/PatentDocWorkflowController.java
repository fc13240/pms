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
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.Order;
import com.lotut.pms.domain.PatentDoc;
import com.lotut.pms.domain.PatentDocOrder;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.AppPersonService;
import com.lotut.pms.service.FriendService;
import com.lotut.pms.service.InventorService;
import com.lotut.pms.service.PatentDocService;
import com.lotut.pms.service.PatentDocWorkflowService;
import com.lotut.pms.service.PatentDocumentTemplateService;
import com.lotut.pms.service.PetitionService;
import com.lotut.pms.service.UserService;
import com.lotut.pms.util.PrincipalUtils;


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
	
	
	@Autowired
	public PatentDocWorkflowController(PatentDocService patentDocService,InventorService inventorService,AppPersonService appPersonService,FriendService friendService,PetitionService petitionService,UserService userService,PatentDocWorkflowService patentDocWorkflowService) {
		this.patentDocService = patentDocService;
		this.inventorService = inventorService;
		this.appPersonService = appPersonService;
		this.friendService = friendService;
		this.petitionService = petitionService;
		this.userService= userService;
		this.patentDocWorkflowService =patentDocWorkflowService;
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
}