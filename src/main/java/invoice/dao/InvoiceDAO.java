package invoice.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import invoice.model.Invoice;

@Repository
public class InvoiceDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Invoice> getAll() {
		String sql = "SELECT * FROM invoice ORDER BY id DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Invoice.class));
	}

	public List<Invoice> getNewInvoice(int n) {
		String sql = "SELECT * FROM invoice ORDER BY id DESC LIMIT ?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Invoice.class), n);
	}

	public List<Invoice> getInvoice(String payment, double min, double max) {
		String sql = "SELECT * FROM invoice WHERE (total BETWEEN ? AND ?) AND payment = ? ORDER BY id DESC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Invoice.class), min, max, payment);
	}

	public int totalRowByCreated(String begin, String end) {
		String sql = "SELECT COUNT(*) FROM invoice WHERE created BETWEEN ? AND ?";
		return jdbcTemplate.queryForObject(sql, Integer.class, begin, end);
	}

	public int save(Invoice invoice) {
		String sql = "INSERT INTO invoice(name,payment,total) VALUES (?,?,?)";
		return jdbcTemplate.update(sql, invoice.getName(), invoice.getPayment(), invoice.getTotal());
	}

	public int update(Invoice invoice) {
		String sql = "UPDATE invoice SET name = ?, payment = ?, total = ? WHERE id = ?";
		return jdbcTemplate.update(sql, invoice.getName(), invoice.getPayment(), invoice.getTotal(), invoice.getId());
	}

	public Invoice findById(int id) {
		try {
			String sql = "SELECT * FROM invoice WHERE id = ?";
			return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Invoice.class), id);
		} catch (Exception e) {
			System.out.println("No data");
		}
		return null;
	}

	public double total(String payment) {
		String sql = "SELECT SUM(total) FROM invoice WHERE payment = ?";
		return jdbcTemplate.queryForObject(sql, Double.class, payment);
	}

}
