<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>

 <style>

        *{
            margin: 0;
            padding: 0;
        }
        @font-face {
            font-family: "gmarket";
            src: url("fonts/GmarketSansMedium.otf");
        }
        @font-face {
            font-family: "nanum";
            src: url("fonts/nanumbarungothic.ttf");
        }
        @media (max-width:900px) {
            body .footer{
                width: 100%;
                height: 170px;
            }
        body .footer p{
                font-size: 5px;
                line-height: 16px;
            }
        }
        .footer{
            width: 100%;
            height: 340px;
            background-color: rgba(198, 191, 205, 1);
        }
        .footer p{
            color: rgba(51, 51, 51, 1);
            font-size: 20px;
            Line-height: 30px;
            text-align: center;
            font-family: "gmarket";
        }

    </style>

</head>
<body>

<div class="footer">
            <p><br><br><br>ⓒ2021 보람줄은 팀 포트폴리오를 위해 제작된 웹페이지 입니다.<br>
                보람줄이란?<br>
                읽던 곳을 표시하거나 특정한 곳을 찾기 편하게 책갈피에 끼울 수 있도록 책에 달아놓은 줄을 뜻 합니다.<br>
                우리는 당신의 보람줄이 되어 기억되길 바랍니다.<br>
                포트폴리오를 봐주셔서 대단히 감사합니다! Thank you!
            </p>
</div>

</body>
</html>