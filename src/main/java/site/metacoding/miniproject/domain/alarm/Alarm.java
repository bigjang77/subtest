package site.metacoding.miniproject.domain.alarm;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Alarm {
    private Integer alarmId;
    private Integer employeeId;
    private Integer companyId;
    private Integer subscribeId;
    private String alarmMessage;
}
