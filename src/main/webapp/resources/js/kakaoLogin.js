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

							var mem_email = response.kakao_account.email;
                   			var mem_name = response.kakao_account.profile.nickname;
                    
                    		var phone_number = response.kakao_account.phone_number;
                    		var mem_phone = (phone_number && phone_number.split(" ").length > 1) ? "0" + phone_number.split(" ")[1] : "";
							

							console.log("정보:", response.kakao_account);
							console.log("이메일:", mem_email);
							console.log("이름:", mem_name);
							console.log("휴대폰:", mem_phone);

							// 전달 받은 값을 다시 로그인 jsp에서 확인하기 위한 폼태그 전송.

							$("#kakaLogin").find("input[name=mem_email]").val(mem_email);
							$("#kakaLogin").find("input[name=mem_name]").val(mem_name);
							$("#kakaLogin").find("input[name=mem_phone]").val(mem_phone);
							$("#kakaLogin").submit();
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