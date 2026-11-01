package com.xworks.inventoryManagement.restcontroller;

import com.xworks.inventoryManagement.dto.ProductDTO;
import com.xworks.inventoryManagement.service.ProductService;
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
public class ProductRestController {

    @Autowired
    private ProductService productService;

    public  ProductRestController(){
        System.out.println("ProductController created.");
    }

    //product listing page
    @GetMapping("Products")
    public String viewProducts(Model model){
        List<ProductDTO> products = productService.findAll();
        model.addAttribute("products",products);
        return "Product";
    }

    //Display add product form
    @GetMapping("AddProduct")
    public String showAddProductForm(Model model){
        model.addAttribute("productDTO", new ProductDTO());
        return "AddProduct";
    }

    //add product
    @PostMapping("SaveProduct")
    public String saveProduct(@Valid ProductDTO productDTO, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes){
        if(bindingResult.hasErrors()){
            model.addAttribute("validationErrors", bindingResult.getAllErrors());
            return "AddProduct";
        }

        boolean saved = productService.save(productDTO);

        if(saved){
            redirectAttributes.addFlashAttribute("message", "Product added successfully");
        } else {
            redirectAttributes.addFlashAttribute("error", "Failed to add product");
        }
        return "redirect:/Products";
    }


    //Display edit the product form
    @GetMapping("EditProduct")
    public String showEditProductForm(@RequestParam("id") Integer id,Model model){
        ProductDTO productDTO = productService.findById(id);
        if(productDTO != null){
            model.addAttribute("productDTO",productDTO);
            return  "EditProduct";
        }
        return "redirect:/Products";
    }


    //Handle edit product form submission
    @PostMapping("UpdateProduct")
    public String updateProduct(@Valid ProductDTO productDTO, BindingResult bindingResult,Model model, RedirectAttributes redirectAttributes){
        if (bindingResult.hasErrors()) {
            model.addAttribute("validationErrors",bindingResult.getAllErrors());
            return "EditProduct";
        }

        boolean updated = productService.update(productDTO);
        if(updated){
            redirectAttributes.addFlashAttribute("message", "Product updated successfully");
        } else {
            redirectAttributes.addFlashAttribute("error", "Failed to update product");
        }
        return "redirect:/Products";
    }


    // Delete product
    @GetMapping("DeleteProduct")
    public String deleteProduct(@RequestParam("id") Integer id, RedirectAttributes redirectAttributes) {
        boolean deleted = productService.deleteById(id);
        if (deleted) {
            redirectAttributes.addFlashAttribute("message", "Product deleted successfully");
        } else {
            redirectAttributes.addFlashAttribute("error", "Failed to delete product");
        }
        return "redirect:/Products";
    }


}
