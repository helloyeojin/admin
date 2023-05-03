package com.kbstar.dto;

import lombok.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Cust {
    @Size(min=4, max=10, message="ID는 최소 4자리, 최대 10자리여야 합니다")
    @NotEmpty(message = "ID는 필수항목입니다") //null값이면 안된다
    private String id;
    @Size(min=5, max=10, message="비밀번호는 최소 5자리 최대 10자리여야 합니다")
    @NotEmpty(message = "비밀번호는 필수항목입니다")
    private String pwd;
    @NotEmpty(message = "이름은 필수항목입니다")
    private String name;


}
