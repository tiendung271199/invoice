package invoice.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Invoice {
	private int id;
	private String name;
	private String payment;
	private double total;
	private Timestamp created;
	
}
