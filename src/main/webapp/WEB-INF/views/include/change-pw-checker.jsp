<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
// 회원가입 페이지 유효성 검사 모듈
$(function() {

    // 검사 결과 저장 객체
    var valid = {
        newPWValid:false,
        checkPWValid:false,
        isAllValid:function() {
			return this.newPWValid && this.checkPWValid;
		}
    }

    // 비밀번호 검사
    $("#pwd_change").blur(function() {
        var regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*?=+_-])[A-Za-z0-9!@#$%^&*?=+_-]{8,16}$/;
        var isValid = regex.test($(this).val());
        valid.newPWValid = isValid;
        $(this).removeClass("valid invalid1").addClass(isValid ? "valid" : "invalid1");
    })
    // 비밀번호 확인 검사
    $("#pwd_check").blur(function() {
        var checkPW = $("[name=newPW]").val();
        var checkPWCheck = $(this).val();
        var isEmpty = !checkPW;
        var isValid = checkPW == checkPWCheck;
        valid.checkPWValid = isValid && !isEmpty;
        $(this).removeClass("valid invalid1 invalid2")
        if(isEmpty) $(this).addClass("invalid2");
        else if(isValid) $(this).addClass("valid");
        else $(this).addClass("invalid1");
    })

    // form 검사
    $(".change-PW-form").submit(function(e) {
        if(valid.isAllValid() == false) {
			e.preventDefault();
		}
        return valid.isAllValid();
    })

});
