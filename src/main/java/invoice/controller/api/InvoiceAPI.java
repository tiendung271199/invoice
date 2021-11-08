package invoice.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import invoice.model.Invoice;
import invoice.service.InvoiceService;
import invoice.util.StringUtil;

@RestController
@CrossOrigin(origins = "*")
public class InvoiceAPI {

	@Autowired
	private InvoiceService invoiceService;

	@GetMapping("demo")
	public String demo() {
		Invoice invoice = invoiceService.findById(2);
		System.out.println(invoice.getCreated());
		return invoice.getCreated().toString();
	}

	@GetMapping("api/invoice")
	public List<Invoice> getAll() {
		return invoiceService.getAll();
	}

	@GetMapping("api/invoice/{n}")
	public List<Invoice> getNewInvoice(@PathVariable int n) {
		return invoiceService.getNewInvoice(n);
	}

	@GetMapping("api/invoice/{payment}/{min}-{max}")
	public List<Invoice> getNewInvoice(@PathVariable String payment, @PathVariable double min,
			@PathVariable double max) {
		return invoiceService.getInvoice(StringUtil.dashToSpace(payment), min, max);
	}

	@GetMapping("api/invoice/count/{month}-{year}")
	public int countInvoice(@PathVariable int month, @PathVariable int year) {
		String begin = StringUtil.getDateBegin(month, year);
		System.out.println(begin);
		String end = StringUtil.getDateEnd(month, year);
		System.out.println(end);
		return invoiceService.totalRowByCreated(begin, end);
	}

	@PutMapping("api/invoice")
	public Invoice update(@RequestBody Invoice invoice) {
		int rs = invoiceService.update(invoice);
		if (rs > 0) {
			return invoiceService.findById(invoice.getId());
		}
		return null;
	}

	@GetMapping("api/invoice/total/{payment}")
	public double total(@PathVariable String payment) {
		return invoiceService.total(StringUtil.dashToSpace(payment));
	}

	@GetMapping("api/invoicebyid/{id}")
	public Invoice findById(@PathVariable int id) {
		return invoiceService.findById(id);
	}

}
