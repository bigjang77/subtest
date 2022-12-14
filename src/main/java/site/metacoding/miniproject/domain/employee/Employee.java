package site.metacoding.miniproject.domain.employee;

import lombok.Getter;
import lombok.Setter;
import site.metacoding.miniproject.web.dto.request.employee.EmployeeUpdateDto;

@Setter
@Getter
public class Employee {
	private Integer employeeId;
	private String employeeName;
	private String employeeBirth;
	private String employeeSex;
	private String employeeUsername;
	private String employeePassword;
	private String employeeEmail;
	private String employeeLocation;
	private String employeeTel;
	private Integer jobId;

	public void update(EmployeeUpdateDto employeeUpdateDto) {
		this.employeeName = employeeUpdateDto.getEmployeeName();
		this.employeeBirth = employeeUpdateDto.getEmployeeBirth();
		this.employeeSex = employeeUpdateDto.getEmployeeSex();
		this.employeeUsername = employeeUpdateDto.getEmployeeUsername();
		this.employeePassword = employeeUpdateDto.getEmployeePassword();
		this.employeeEmail = employeeUpdateDto.getEmployeeEmail();
		this.employeeLocation = employeeUpdateDto.getEmployeeLocation();
		this.employeeTel = employeeUpdateDto.getEmployeeTel();

	}

	// 엔티티 필드 아님
	private Integer companyId;
}
