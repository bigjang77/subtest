package site.metacoding.miniproject.service;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject.domain.employee.Employee;
import site.metacoding.miniproject.domain.employee.EmployeeDao;
import site.metacoding.miniproject.web.dto.request.employee.EmployeeLoginDto;
import site.metacoding.miniproject.web.dto.request.employee.EmployeeUpdateDto;
import site.metacoding.miniproject.web.dto.response.CMRespDto;

@RequiredArgsConstructor
@Service
public class EmployeeService {

    private final EmployeeDao employeeDao;

    public void employeeDelete(Integer employeeId) {
        employeeDao.deleteById(employeeId);
    }

    public Employee employeeUpdate(Integer employeeId, EmployeeUpdateDto employeeUpdateDto) {
        Employee employeePS = employeeDao.findById(employeeId);
        employeePS.update(employeeUpdateDto);
        employeeDao.update(employeePS);
        return employeePS;
    }

    public Employee 로그인(EmployeeLoginDto loginDto) {
        Employee employeePS = employeeDao.findByEmployeeUsername(loginDto.getEmployeeUsername());
        if (employeePS.getEmployeePassword().equals(loginDto.getEmployeePassword())) {
            return employeePS;
        }
        return null;
    }

    public void employeeJoin(Employee employee) {
        employeeDao.insert(employee);
    }

    public Employee employeeUpdate(Integer employeeId) {
        return null;
    }

}
