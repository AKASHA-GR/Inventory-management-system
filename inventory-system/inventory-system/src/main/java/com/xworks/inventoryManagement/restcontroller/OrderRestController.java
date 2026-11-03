package com.xworks.inventoryManagement.restcontroller;

import com.xworks.inventoryManagement.dto.OrderDTO;
import com.xworks.inventoryManagement.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/")
public class OrderRestController {

    @Autowired
    private OrderService orderService;

    public OrderRestController(){
        System.out.println("OrderController created.");
    }

    //order listing page
    @GetMapping("OrderList")
    public String viewOrders(Model model){
        List<OrderDTO> orders = orderService.findAll();
        model.addAttribute("orders", orders);
        return "Order";
    }

    //Display add order form
    @GetMapping("AddOrder")
    public String showAddOrderForm(Model model){
        model.addAttribute("orderDTO", new OrderDTO());
        return "AddOrder";
    }

    //add order
    @PostMapping("SaveOrder")
    public String saveOrder(@Valid OrderDTO orderDTO, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes){
        if(bindingResult.hasErrors()){
            model.addAttribute("validationErrors", bindingResult.getAllErrors());
            return "AddOrder";
        }

        boolean saved = orderService.save(orderDTO);

        if(saved){
            redirectAttributes.addFlashAttribute("message", "Order added successfully");
        } else {
            redirectAttributes.addFlashAttribute("error", "Failed to add order");
        }
        return "redirect:/OrderList";
    }

    //Display edit the order form
    @GetMapping("EditOrder")
    public String showEditOrderForm(@RequestParam("id") Integer id, Model model){
        OrderDTO orderDTO = orderService.findById(id);
        if(orderDTO != null){
            model.addAttribute("orderDTO", orderDTO);
            return "EditOrder";
        }
        return "redirect:/OrderList";
    }

    //Handle edit order form submission
    @PostMapping("UpdateOrder")
    public String updateOrder(@Valid OrderDTO orderDTO, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes){
        if (bindingResult.hasErrors()) {
            model.addAttribute("validationErrors", bindingResult.getAllErrors());
            return "EditOrder";
        }

        boolean updated = orderService.update(orderDTO);
        if(updated){
            redirectAttributes.addFlashAttribute("message", "Order updated successfully");
        } else {
            redirectAttributes.addFlashAttribute("error", "Failed to update order");
        }
        return "redirect:/OrderList";
    }

    // Delete order
    @GetMapping("DeleteOrder")
    public String deleteOrder(@RequestParam("id") Integer id, RedirectAttributes redirectAttributes) {
        boolean deleted = orderService.deleteById(id);
        if (deleted) {
            redirectAttributes.addFlashAttribute("message", "Order deleted successfully");
        } else {
            redirectAttributes.addFlashAttribute("error", "Failed to delete order");
        }
        return "redirect:/OrderList";
    }

}
