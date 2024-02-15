/**
	 * kakaoLogin.js
	 */

	Kakao.init('7af7b7d13502aeea69908896cb3f9201');
		Kakao.isInitialized();

		function kakaoLogin() {
			Kakao.Auth.login({
				success : function(response) {
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(response) {
							console.log(" response.kakao_account :" , response.kakao_account);
							var mem_email = response.kakao_account.email;
                   			var mem_name = response.kakao_account.name;
                    		var birthyear = response.kakao_account.birthyear;
                    		var birthday = response.kakao_account.birthday;
                    		var mem_birth = "";
								if (birthyear && birthday) {
    								var formattedBirthday = birthday.substring(0, 2) + "-" + birthday.substring(2);
    								mem_birth = birthyear + "-" + formattedBirthday;
							}
                    		var mem_addr = response.kakao_account.shipping_address;
                    		var phone_number = response.kakao_account.phone_number;
                    		
							var mem_phone = (phone_number && phone_number.replace(/-/g, "").split(" ").join("")) || "";		

							console.log("정보:", response.kakao_account);
							console.log("이메일:", mem_email);
							console.log("이름:", mem_name);
							console.log("휴대폰:", mem_phone);

							// 전달 받은 값을 다시 로그인 jsp에서 확인하기 위한 폼태그 전송.

							$("#kakaLogin").find("input[name=mem_email]").val(mem_email);
							$("#kakaLogin").find("input[name=mem_name]").val(mem_name);
							$("#kakaLogin").find("input[name=mem_phone]").val(mem_phone);
							$("#kakaLogin").find("input[name=mem_birth]").val(mem_birth);
							//$("#kakaLogin").submit();
						},

						fail : function(error) {
							console.log(error);

						},
					})
				},
				fail : function(error) {
					console.log(error);
				},
			});
		}
		
$(document).ready(function() {
    // 카카오 로그인 버튼에 클릭 이벤트 추가
    $("#kakaoLoginButton").click(function() {
        kakaoLogin(); // Kakao 로그인 함수 호출
    });
});			