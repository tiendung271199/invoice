package invoice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import invoice.dao.InvoiceDAO;
import invoice.model.Invoice;

@Service
public class InvoiceService {

	@Autowired
	private InvoiceDAO invoiceDAO;

	public List<Invoice> getAll() {
		return invoiceDAO.getAll();
	}

	public List<Invoice> getNewInvoice(int n) {
		return invoiceDAO.getNewInvoice(n);
	}

	public List<Invoice> getInvoice(String payment, double min, double max) {
		return invoiceDAO.getInvoice(payment, min, max);
	}

	public int totalRowByCreated(String begin, String end) {
		return invoiceDAO.totalRowByCreated(begin, end);
	}

	public int save(Invoice invoice) {
		return invoiceDAO.save(invoice);
	}

	public int update(Invoice invoice) {
		return invoiceDAO.update(invoice);
	}

	public Invoice findById(int id) {
		return invoiceDAO.findById(id);
	}

	public double total(String payment) {
		return invoiceDAO.total(payment);
	}

}
