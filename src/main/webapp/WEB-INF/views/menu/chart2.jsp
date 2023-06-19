<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/reset.css">
    <link rel="stylesheet" href="resources/css/substyle.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.1.1/chart.min.js"></script>
</head>
<body class="bg">
    <div class="wrapper">
		<jsp:include page="../common/my.jsp"></jsp:include>
		<jsp:include page="../common/header2.jsp"></jsp:include>
		<!-- modal -->
        <div class="modal hide">
            <div class="modal_back"></div>
            <div class="modal_content chart_modal_content">
                차트를 생성할 충분한 데이터가 수집되지 않았습니다.
                <button class="btn_close">
                    <span class="material-symbols-outlined icon_close">
                    close
                    </span>
                </button>
            </div>
        </div>
<%-- 		<input type="hidden" value="${vo.mbIdx}" id="memId">
        <input type="hidden" value="${pvo.petIdx}" id="petId"> --%>
        <div class="content chart_con">
            <div class="chart_type">
                <div class="select weekly">
                    <span class="select weekly">주간 리포트</span>
                </div>
                <div class="monthly">
                    <span class="monthly">월간 리포트</span>
                </div>
            </div>
            <!-- date -->
            <div class="chart1">
            <div class="date_wrap">
                <ul class="chart_date_ul">
                    <li class="date">
                        <p>3월</p>
                        <p>12</p>
                    </li>
                    <input type="hidden" value="2023-03-12">
                    <li class="date">
                        <p>3월</p>
                        <p>19</p>
                    </li>
                    <input type="hidden" value="2023-03-19">
                    <li class="date">
                        <p>3월</p>
                        <p>26</p>
                    </li>
                    <input type="hidden" value="2023-03-26">
                    <li class="date">
                        <p>4월</p>
                        <p>02</p>
                    </li>
                    <input type="hidden" value="2023-04-02">
                    <li class="date">
                        <p>4월</p>
                        <p>09</p>
                    </li>
                    <input type="hidden" value="2023-04-09">
                    <li class="date">
                        <p>4월</p>
                        <p>16</p>
                    </li>
                    <input type="hidden" value="2023-04-16">
                    <li class="date">
                        <p>4월</p>
                        <p>23</p>
                    </li>
                    <input type="hidden" value="2023-04-23">
                    <li class="date">
                        <p>4월</p>
                        <p>30</p>
                    </li>
                    <input type="hidden" value="2023-04-30">
                    <li class="date">
                        <p>5월</p>
                        <p>07</p>
                    </li>
                    <input type="hidden" value="2023-05-07">
                    <li class="date">
                        <p>5월</p>
                        <p>14</p>
                    </li>
                    <input type="hidden" value="2023-05-14">
                    <li class="date">
                        <p>5월</p>
                        <p>28</p>
                    </li>
                    <input type="hidden" value="2023-05-28">
                    <li class="date">
                        <p>6월</p>
                        <p>04</p>
                    </li>
                    <input type="hidden" value="2023-06-04">
                    <li class="date">
                        <p>6월</p>
                        <p>11</p>
                    </li>
                    <input type="hidden" value="2023-06-11">
                    <li class="date date_today test">
                        <p>6월</p>
                        <p>18</p>
                    </li>
                    <input type="hidden" value="2023-06-18">
                </ul>
            </div>
                <div class="con">
                    <div class="chart_date">
                        <span id="month_week"></span>
                        <span id="week_range"></span>
                    </div>
                    <div class="chart">
                        <div class="chart_total">
                            <div class="chart_name">TOTAL</div>
                            <div class="chart_wrap">
                                <!-- chart -->
                                <canvas id="totalWeeklyChart" class="myChart" aria-level="chart"></canvas>
                            </div>
                            <div class="chart_detail" id="chartWeekResult">
                                일주일 기준, 이상행동의 일 평균 시간과 횟수는 다음과 같습니다. 그루밍 평균 3시간, 피부긁음 4회,
                                재채기 2회, 식사 12회, 배변 4회, 구토 0.4회, 써클링 0회, 개구호흡 0.1회, 발작 0회, 후지마비 0회입니다.
                            </div>
                        </div>
                        <ul class="chart_list" id="chartWeekList">
                        	<!-- 그루밍  -->
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>그루밍</span>
                                        <span class="material-symbols-outlined icon_circle green chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                            <canvas id="weeklyChart0" class="myChart"></canvas>
                                        </div>
                                        <div class="chart_result">
                                            그루밍 시간은 한 주 평균 3시간 정도입니다. 월(3.03H), 화(2.36H), 수(3.41H), 목(2.47H),
                                            금(3.44H), 토(4.07H), 일(3.38H)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
                                        그루밍은 털을 정갈하게하기위해 이빨이나 발톱 등으로 털을 다듬는 행동을 말합니다.
										식후 또는 휴식을 취할 때, 진정을 하기위해서 다양한 이유가 있습니다. 깨어있는 시간의 약 24%를 털을 다듬는데 소비하여,하루 평균 2.4-4시간 정도로 그루밍을 합니다.
										고양이마다 평균적인 그루밍 시간은 조금씩 다릅니다.
										네로의 일주일동안 평균적인 시간을 확인하고 급격히 시간이 많아지거나 줄어든 경우, 질병 발생 위험성을 감지할수 있습니다.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- 피부긁음 -->
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>피부 긁음</span>
                                        <span class="material-symbols-outlined icon_circle green chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                            <canvas id="weeklyChart1" class="myChart"></canvas>
                                        </div>
                                        <div class="chart_result">
                                            피부긁음 횟수는 한 주 평균 4회 정도입니다. 월(5회), 화(2회), 수(6회), 목(5회),
                                            금(3회), 토(8회), 일(3회)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
                                        고양이가 긁는 행동을 하는 이유는 과도한 탈모와 피부 감염을 피하기 위해서입니다.
										하루 10회 이상 지속적으로 긁는 행동을 한다면 벼룩이나 진드기, 알레르기. 피부 질환, 스트레스 등이 의심됩니다. 
										네로의 일주일동안 평균적인 횟수를 확인하고 급격히 빈도수가 많아지거나 줄어든 경우, 질병 발생 위험성을 감지할수 있습니다.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- 재채기 -->
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>재채기</span>
                                        <span class="material-symbols-outlined icon_circle yel chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                            <canvas id="weeklyChart2" class="myChart"></canvas>
                                        </div>
                                        <div class="chart_result">
                                            재채기 횟수는 전체적으로 높은 편으로, 한 주 평균 4회 정도입니다. 월(3회), 화(5회), 수(4회), 목(2회),
                                            금(1회), 토(0회), 일(1회)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
											재채기는 꽃가루, 곰팡이, 먼지 진드기 등과 같은 외부 이물질에 대한 알레르기 반응 등으로 나타납니다.
											하루 4회 이상 재채기를 한다면 바이러스로 인한 감기, 알레르기성 비염, 잇몸 질환 등이 의심됩니다.
											네로의 3일동안 평균적인 식사 횟수를 확인하고, 평소보다 횟수가 많아질 경우 질병 발생 위험성을 감지할수 있습니다. 
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- 식사 -->
                             <li>
                                <div>
                                    <div class="chart_name">
                                        <span>식사</span>
                                        <span class="material-symbols-outlined icon_circle yel chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                            <canvas id="weeklyChart3" class="myChart"></canvas>
                                        </div>
                                        <div class="chart_result">
                                            식사 시간은 전체적으로 높은 편으로, 한 주 평균 12회 정도입니다. 월(13회), 화(12회), 수(10회), 목(9회),
                                            금(15회), 토(14회), 일(11회)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
											식욕 저하는 열, 빈혈, 신장, 심장 간기능에 이상이 오거나 전해질 불균형 등등의 아주 많은 질병의 초기에 식욕이 감퇴됩니다.
											하루 0-1회 이하 식사를 한다면 자방간, 호흡기 질환, 소화기계 질병, 구강 관련 질병, 이물질 섭취 등이 의심됩니다.
											네로의 3일 간의 식사량이 보통의 절반/36시간동안 음식 섭취가 없으므로 질병 발생 위험성을 감지할수 있습니다.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- 배변 -->
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>배변</span>
                                        <span class="material-symbols-outlined icon_circle green chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                            <canvas id="weeklyChart4" class="myChart"></canvas>
                                        </div>
                                        <div class="chart_result">
                                            배변 횟수는 한 주 평균 4회 정도입니다. 월(5회), 화(4회), 수(4회), 목(3회),
                                            금(6회), 토(3회), 일(4회)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
											고양이의 평균 배변 횟수는 성묘 기준 대변은 하루 1~2회 그리고 소변은 2~4회가 평균적인 횟수입니다.
											배변 관련 질병으로는 당뇨병, 만성신부전, 알레르기로 인한 소화 불량, 기타 질병 등이 있습니다.
											네로의 1일동안 평균적인 횟수를 확인하고 하루 평균 7회 이상 배변을 본다면 질병 발생 위험성을 감지할수 있습니다.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- 구토 -->
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>구토</span>
                                        <span class="material-symbols-outlined icon_circle yel chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                            <canvas id="weeklyChart5" class="myChart"></canvas>
                                        </div>
                                        <div class="chart_result">
                                            구토 횟수는 한 주 평균 0.4회 정도입니다. 월(0회), 화(2회), 수(0회), 목(0회),
                                            금(1회), 토(0회), 일(0회)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
											고양이의 구토 원인은 한 달에 1~2회 정도는 정상적으로 헤어볼 구토가 나올 수 있습니다. 
											다른 원인으로는 위 관련 질병, 췌장염, 신장병 등의 질병 등이 있습니다. 
											붉은색, 연한 붉은색, 어두운 붉은색의 토를 할 경우 체내에서 출혈 발생이 원인입니다.
											네로의 1일동안 평균적인 횟수를 확인하고 하루 평균 3번 이상 구토를 할 경우 질병 발생 위험성을 감지할수 있습니다.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- 써클링 -->
                           <li>
                                <div>
                                    <div class="chart_name">
                                        <span>써클링</span>
                                        <span class="material-symbols-outlined icon_circle green chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                            <canvas id="weeklyChart6" class="myChart"></canvas>
                                        </div>
                                        <div class="chart_result">
                                            써클링 횟수는 한 주 평균 0회 정도입니다. 월(0회), 화(0회), 수(0회), 목(0회),
                                            금(0회), 토(0회), 일(0회)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
											써클링이란 동물이 이유 없이 제자리를 뱅글뱅글 도는 현상을 뜻합니다.
											하루 1회 이상 서클링을 할 경우 두부 외상, 뇌수막염 등으로 인해 뇌의 특정 부분에 이상이 생겼을 때 발생합니다.
											이외의 노령묘의 경우 방향감각 상실 등을 동반하면 초기 치매를 의심할 수 있습니다.
											네로의 일주일동안 평균적인 횟수를 확인하고 급격히 횟수가 많아질 경우, 질병 발생 위험성을 감지할수 있습니다.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- 개구호흡 -->
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>개구호흡</span>
                                        <span class="material-symbols-outlined icon_circle yel chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                            <canvas id="weeklyChart7" class="myChart"></canvas>
                                        </div>
                                        <div class="chart_result">
                                            개구호흡 횟수는 한 주 평균 0.1회 정도입니다. 월(0회), 화(0회), 수(0회), 목(0회),
                                            금(1회), 토(0회), 일(0회)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
											고양이 개구호흡은 격하게 사냥놀이한 직후나 여름철 체온이 급격하게 높아졌을 때 일시적인 상황을 말합니다.
											하지만 고양이가 갑자기 입으로 헥헥 소리를 내며 숨을 쉰다면 위험한 신호 중 하나입니다.
											빈혈이나, 탈수, 심장 사상충 감염, 신부전, 고혈압, 복막염, 갑상선 기능 항진증 등 질병에 의해 개구 호흡할 수도 있습니다.
											네로의 일주일동안 호흡의 평균적인 횟수를 확인하고 급격히 빈도수가 많아지거나 빨라진 경우, 질병 발생 위험성을 감지할수 있습니다.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- 발작 -->
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>발작</span>
                                        <span class="material-symbols-outlined icon_circle green chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                            <canvas id="weeklyChart8" class="myChart"></canvas>
                                        </div>
                                        <div class="chart_result">
                                            발작 횟수는 한 주 평균 0회 정도입니다. 월(0회), 화(0회), 수(0회), 목(0회),
                                            금(0회), 토(0회), 일(0회)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
											발작은 뇌에서 발생하는 통제되지 않는 전기적 활동의 신체적 징후로 가장 흔하게 발생하는 신경계 문제입니다.
											발작의 원인으로는 뇌수두증, 뇌염, 뇌종양 같은 뇌 안 쪽 문제를 의심할 수 있습니다.
											뇌가 아닌 다른 원인으로는 대사성 질환, 심혈관 질병, 근 무력증, 종양, 간기능 부전 등의 다양한 원인에 의해 발생합니다.
											네로의 일주일동안 평균적인 횟수를 확인하고 횟수를 초과했을 경우, 질병 발생 위험성을 감지할수 있습니다.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- 후지마비 -->
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>후지마비</span>
                                        <span class="material-symbols-outlined icon_circle green chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                            <canvas id="weeklyChart9" class="myChart"></canvas>
                                        </div>
                                        <div class="chart_result">
                                            후지마비 횟수는 한 주 평균 0회 정도입니다. 월(0회), 화(0회), 수(0회), 목(0회),
                                            금(0회), 토(0회), 일(0회)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
											후지마비의 원인으로는 대부분의 반려묘는 동맥혈전색전증을 의심할 수 있습니다.
											또 다른 원인으로는 신경손상, 신경계 염증 등이 있습니다.
											보행장애 외에도, 감각소실, 청색증 등의 문제를 나타내기도 합니다.
											육안으로 확인 할수 있는 경우는 뒷다리를 갑자기 끄는 증상을
											보이게 되며, 앞다리에도 간헐적으로 발생합니다. 네
											로의 일주일동안 평균적인 횟수를 확인하고 횟수가 증가할 경우,
											질병 발생 위험성을 감지할수 있습니다.
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
            <!-- =================================================================================================================================================================== -->
			<!-- 월간 -->
            <div class="chart2 hide">
	            <div class="date_wrap">
	                <ul class="chart_date_ul">
	                    <li class="date">
	                        <p>4월</p>
	                        <p>30</p>
	                    </li>
	                    <li class="date">
	                        <p>5월</p>
	                        <p>31</p>
	                    </li>
	                    <li class="date">
	                        <p>6월</p>
	                        <p>30</p>
	                    </li>
	                    <li class="date">
	                        <p>7월</p>
	                        <p>31</p>
	                    </li>
	                    <li class="date">
	                        <p>8월</p>
	                        <p>31</p>
	                    </li>
	                    <li class="date">
	                        <p>9월</p>
	                        <p>30</p>
	                    </li>
	                    <li class="date">
	                        <p>10월</p>
	                        <p>31</p>
	                    </li>
	                    <li class="date">
	                        <p>11월</p>
	                        <p>30</p>
	                    </li>
	                    <li class="date">
	                        <p>12월</p>
	                        <p>31</p>
	                    </li>
	                    <li class="date">
	                        <p>1월</p>
	                        <p>31</p>
	                    </li>
	                    <li class="date">
	                        <p>2월</p>
	                        <p>28</p>
	                    </li>
	                    <li class="date">
	                        <p>3월</p>
	                        <p>31</p>
	                    </li>
	                    <li class="date">
	                        <p>4월</p>
	                        <p>30</p>
	                    </li>
	                    <li class="date date_today test">
	                        <p>5월</p>
	                        <p>31</p>
	                    </li>
	                </ul>
	            </div>
                <div class="con">
                	<div class="chart_date">
                        <span id="month_range"></span>
                    </div>
						<div class="chart">
                        <div class="chart_total">
                            <div class="chart_name">TOTAL</div>
                            <div class="chart_wrap">
                                <!-- chart -->
                                <canvas id="totalMonthlyChart" class="myChart" aria-level="chart"></canvas>
                            </div>
                            <div class="chart_detail" id="chartWeekResult">
                                한 달 기준, 이상행동의 일 평균 시간과 횟수는 다음과 같습니다. 그루밍 평균 3시간, 피부긁음 4회,
                                재채기 2회, 식사 12회, 배변 4회, 구토 0.4회, 써클링 0회, 개구호흡 0.1회, 발작 0회, 후지마비 0회입니다.
                            </div>
                        </div>
                        <ul class="chart_list" id="chartWeekList">
                        	<!-- 그루밍  -->
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>그루밍</span>
                                        <span class="material-symbols-outlined icon_circle green chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                            <canvas id="monthlyChart0" class="myChart"></canvas>
                                        </div>
                                        <div class="chart_result">
                                            그루밍 시간은 한 달 평균 3시간 정도입니다. 1주(3.03H), 2주(2.36H), 3주(3.41H), 4주(2.47H),
                                            5주(3.44H)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
                                        그루밍은 털을 정갈하게하기위해 이빨이나 발톱 등으로 털을 다듬는 행동을 말합니다.
										식후 또는 휴식을 취할 때, 진정을 하기위해서 다양한 이유가 있습니다. 깨어있는 시간의 약 24%를 털을 다듬는데 소비하여,하루 평균 2.4-4시간 정도로 그루밍을 합니다.
										고양이마다 평균적인 그루밍 시간은 조금씩 다릅니다.
										네로의 일주일동안 평균적인 시간을 확인하고 급격히 시간이 많아지거나 줄어든 경우, 질병 발생 위험성을 감지할수 있습니다.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- 피부긁음 -->
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>피부 긁음</span>
                                        <span class="material-symbols-outlined icon_circle green chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                            <canvas id="monthlyChart1" class="myChart"></canvas>
                                        </div>
                                        <div class="chart_result">
                                            피부긁음 횟수는 한 달 평균 4회 정도입니다. 1주(5회), 2주(2회), 3주(6회), 4주(5회),
                                            5주(3회)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
                                        고양이가 긁는 행동을 하는 이유는 과도한 탈모와 피부 감염을 피하기 위해서입니다.
										하루 10회 이상 지속적으로 긁는 행동을 한다면 벼룩이나 진드기, 알레르기. 피부 질환, 스트레스 등이 의심됩니다. 
										네로의 일주일동안 평균적인 횟수를 확인하고 급격히 빈도수가 많아지거나 줄어든 경우, 질병 발생 위험성을 감지할수 있습니다.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- 재채기 -->
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>재채기</span>
                                        <span class="material-symbols-outlined icon_circle yel chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                            <canvas id="monthlyChart2" class="myChart"></canvas>
                                        </div>
                                        <div class="chart_result">
                                            재채기 횟수는 전체적으로 높은 편으로, 한 달 평균 4회 정도입니다. 1주(3회), 2주(5회), 3주(4회), 4주(2회),
                                            5주(1회)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
											재채기는 꽃가루, 곰팡이, 먼지 진드기 등과 같은 외부 이물질에 대한 알레르기 반응 등으로 나타납니다.
											하루 4회 이상 재채기를 한다면 바이러스로 인한 감기, 알레르기성 비염, 잇몸 질환 등이 의심됩니다.
											네로의 3일동안 평균적인 식사 횟수를 확인하고, 평소보다 횟수가 많아질 경우 질병 발생 위험성을 감지할수 있습니다. 
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- 식사 -->
                             <li>
                                <div>
                                    <div class="chart_name">
                                        <span>식사</span>
                                        <span class="material-symbols-outlined icon_circle yel chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                            <canvas id="monthlyChart3" class="myChart"></canvas>
                                        </div>
                                        <div class="chart_result">
                                            식사 시간은 전체적으로 높은 편으로, 한 달 평균 12회 정도입니다. 1주(13회), 2주(12회), 3주(10회), 4주(9회),
                                            5주(15회)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
											식욕 저하는 열, 빈혈, 신장, 심장 간기능에 이상이 오거나 전해질 불균형 등등의 아주 많은 질병의 초기에 식욕이 감퇴됩니다.
											하루 0-1회 이하 식사를 한다면 자방간, 호흡기 질환, 소화기계 질병, 구강 관련 질병, 이물질 섭취 등이 의심됩니다.
											네로의 3일 간의 식사량이 보통의 절반/36시간동안 음식 섭취가 없으므로 질병 발생 위험성을 감지할수 있습니다.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- 배변 -->
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>배변</span>
                                        <span class="material-symbols-outlined icon_circle green chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                            <canvas id="monthlyChart4" class="myChart"></canvas>
                                        </div>
                                        <div class="chart_result">
                                            배변 횟수는 한 달 평균 4회 정도입니다. 1주(5회), 2주(4회), 3주(4회), 4주(3회),
                                            5주(6회)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
											고양이의 평균 배변 횟수는 성묘 기준 대변은 하루 1~2회 그리고 소변은 2~4회가 평균적인 횟수입니다.
											배변 관련 질병으로는 당뇨병, 만성신부전, 알레르기로 인한 소화 불량, 기타 질병 등이 있습니다.
											네로의 1일동안 평균적인 횟수를 확인하고 하루 평균 7회 이상 배변을 본다면 질병 발생 위험성을 감지할수 있습니다.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- 구토 -->
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>구토</span>
                                        <span class="material-symbols-outlined icon_circle yel chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                            <canvas id="monthlyChart5" class="myChart"></canvas>
                                        </div>
                                        <div class="chart_result">
                                            구토 횟수는 한 달 평균 0.4회 정도입니다. 1주(0회), 2주(2회), 3주(0회), 4주(0회),
                                            5주(1회)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
											고양이의 구토 원인은 한 달에 1~2회 정도는 정상적으로 헤어볼 구토가 나올 수 있습니다. 
											다른 원인으로는 위 관련 질병, 췌장염, 신장병 등의 질병 등이 있습니다. 
											붉은색, 연한 붉은색, 어두운 붉은색의 토를 할 경우 체내에서 출혈 발생이 원인입니다.
											네로의 1일동안 평균적인 횟수를 확인하고 하루 평균 3번 이상 구토를 할 경우 질병 발생 위험성을 감지할수 있습니다.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- 써클링 -->
                           <li>
                                <div>
                                    <div class="chart_name">
                                        <span>써클링</span>
                                        <span class="material-symbols-outlined icon_circle green chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                            <canvas id="monthlyChart6" class="myChart"></canvas>
                                        </div>
                                        <div class="chart_result">
                                            써클링 횟수는 한 달 평균 0회 정도입니다. 1주(0회), 2주(0회), 3주(0회), 4주(0회),
                                            5주(0회)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
											써클링이란 동물이 이유 없이 제자리를 뱅글뱅글 도는 현상을 뜻합니다.
											하루 1회 이상 서클링을 할 경우 두부 외상, 뇌수막염 등으로 인해 뇌의 특정 부분에 이상이 생겼을 때 발생합니다.
											이외의 노령묘의 경우 방향감각 상실 등을 동반하면 초기 치매를 의심할 수 있습니다.
											네로의 일주일동안 평균적인 횟수를 확인하고 급격히 횟수가 많아질 경우, 질병 발생 위험성을 감지할수 있습니다.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- 개구호흡 -->
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>개구호흡</span>
                                        <span class="material-symbols-outlined icon_circle yel chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                            <canvas id="monthlyChart7" class="myChart"></canvas>
                                        </div>
                                        <div class="chart_result">
                                            개구호흡 횟수는 한 달 평균 0.1회 정도입니다. 1주(0회), 2주(0회), 3주(0회), 4주(0회),
                                            5주(1회)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
											고양이 개구호흡은 격하게 사냥놀이한 직후나 여름철 체온이 급격하게 높아졌을 때 일시적인 상황을 말합니다.
											하지만 고양이가 갑자기 입으로 헥헥 소리를 내며 숨을 쉰다면 위험한 신호 중 하나입니다.
											빈혈이나, 탈수, 심장 사상충 감염, 신부전, 고혈압, 복막염, 갑상선 기능 항진증 등 질병에 의해 개구 호흡할 수도 있습니다.
											네로의 일주일동안 호흡의 평균적인 횟수를 확인하고 급격히 빈도수가 많아지거나 빨라진 경우, 질병 발생 위험성을 감지할수 있습니다.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- 발작 -->
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>발작</span>
                                        <span class="material-symbols-outlined icon_circle green chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                            <canvas id="monthlyChart9" class="myChart"></canvas>
                                        </div>
                                        <div class="chart_result">
                                            발작 횟수는 한 달 평균 0회 정도입니다. 1주(0회), 2주(0회), 3주(0회), 4주(0회),
                                            5주(0회)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
											발작은 뇌에서 발생하는 통제되지 않는 전기적 활동의 신체적 징후로 가장 흔하게 발생하는 신경계 문제입니다.
											발작의 원인으로는 뇌수두증, 뇌염, 뇌종양 같은 뇌 안 쪽 문제를 의심할 수 있습니다.
											뇌가 아닌 다른 원인으로는 대사성 질환, 심혈관 질병, 근 무력증, 종양, 간기능 부전 등의 다양한 원인에 의해 발생합니다.
											네로의 일주일동안 평균적인 횟수를 확인하고 횟수를 초과했을 경우, 질병 발생 위험성을 감지할수 있습니다.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- 후지마비 -->
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>후지마비</span>
                                        <span class="material-symbols-outlined icon_circle green chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                            <canvas id="monthlyChart10" class="myChart"></canvas>
                                        </div>
                                        <div class="chart_result">
                                            후지마비 횟수는 한 달 평균 0회 정도입니다. 1주(0회), 2주(0회), 3주(0회), 4주(0회),
                                            5주(0회)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
											후지마비의 원인으로는 대부분의 반려묘는 동맥혈전색전증을 의심할 수 있습니다.
											또 다른 원인으로는 신경손상, 신경계 염증 등이 있습니다.
											보행장애 외에도, 감각소실, 청색증 등의 문제를 나타내기도 합니다.
											육안으로 확인 할수 있는 경우는 뒷다리를 갑자기 끄는 증상을
											보이게 되며, 앞다리에도 간헐적으로 발생합니다. 네
											로의 일주일동안 평균적인 횟수를 확인하고 횟수가 증가할 경우,
											질병 발생 위험성을 감지할수 있습니다.
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
					
                </div>

		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
        </div>
    </div>

    <script>
        $(document).ready(function(e) {
        	
        	$(".chart_header").toggleClass("hide");
        	$("#chart_footer").toggleClass("this_menu");
        	
    	    /* 몇월 몇주 날짜 범위 출력 */
	    	var weekAndMonth = new Date($(".date_today").next().val());
	    	var month = weekAndMonth.getMonth()+1;
	    	var week = Math.ceil((weekAndMonth.getDate() + weekAndMonth.getDay()) / 7) - 1;
	    	var txt = month+"월"+week+"주";
	    	$("#month_week").text(txt);
	    	

			var selectDate = $(".date_today").next().val();
			var currentDate = new Date(selectDate);
			currentDate.setDate(currentDate.getDate() - 6);
			
			var year = currentDate.getFullYear();
			var month = currentDate.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줌
			var day = currentDate.getDate();
			
			var sixDaysAgo = ('0'+year).slice(-2) + '.' + ('0' + month).slice(-2) + '.' + ('0' + day).slice(-2);
	    	
			targetDate = selectDate.split("-").join(".").slice(2);
			
	    	$("#week_range").text(sixDaysAgo+"~"+targetDate);
	    	$("#month_range").text(month-1+"월");
        	
	    	// 상단 날짜 슬라이드
    	    var x = 0;
    	    var tabx = 0;
    	    var xx = 0;
    	    var limit = $(".chart_date_ul").width() - $(".date_wrap").width() + 12;
    	    $(".chart_date_ul").bind('touchstart', function(e) {
    	        var event = e.originalEvent;
    	        x = event.touches[0].screenX;
    	        tabx = $(".chart_date_ul").css("transform").replace(/[^0-9\-.,]/g, '').split(',')[4];
    	    });
    	    $(".chart_date_ul").bind('touchmove', function(e) {
    	        var event = e.originalEvent;
    	        xx = parseInt(tabx) + parseInt(event.touches[0].screenX - x);
    	        $(".chart_date_ul").css("transform", "translate(" + xx + "px, 0px)");
    	        event.preventDefault();
    	    });
    	    $(".chart_date_ul").bind('touchend', function(e) {
    	        if ((xx > 0) && (tabx <= 0)) {
    	        $(".chart_date_ul").css("transform", "translate(0px, 0px)");
    	        }
    	        if (Math.abs(xx) > limit) {
    	        $(".chart_date_ul").css("transform", "translate(" + -limit + "px, 0px)");
    	        }
    	    });
    	    
	    	/* 차트 열고 닫기 */
            $(document).on("click", ".chart_list>li", function(){
                $(this).find(".chart_hide").toggleClass("hide");
                $(this).find(".icon_chart_up").toggleClass("hide");
                $(this).find(".icon_chart_down").toggleClass("hide");
            });

	    	/* 주간,월간 변환 */
            $(".chart_type>div:eq(0)").on("click", function(){
            	$(".weekly").addClass("select");
            	$(".chart1").removeClass("hide");
            	$(".monthly").removeClass("select");
            	$(".chart2").addClass("hide");
            	
            	$(".chart").removeClass("hide");
            	//$(".chart_date_ul li").last().css({'backgroundColor': '#f6cccc', 'color': '#cd0000'});
            	$(".chart1 > .date_wrap > .chart_date_ul li").last().addClass("date_today");
            	$(".chart2 > .date_wrap > .chart_date_ul li").last().removeClass("date_today");
            });

            $(".chart_type>div:eq(1)").on("click", function(){
            	$(".monthly").addClass("select");
            	$(".chart2").removeClass("hide");
            	$(".weekly").removeClass("select");
            	$(".chart1").addClass("hide");
            	
            	$(".chart").removeClass("hide");
            	//$(".chart_date_ul li").last().css({'backgroundColor': '#f6cccc', 'color': '#cd0000'});
            	$(".chart2 > .date_wrap > .chart_date_ul li").last().addClass("date_today");
            	$(".chart1 > .date_wrap > .chart_date_ul li").last().removeClass("date_today");
            });
                       
            /* 오늘 날짜 클릭시 이벤트 */
           	var changeDate = function(){
    	    	if($(this).hasClass("today")===true){
    	    		e.preventDefault();
    	    	} else{
    		    	$(".date").not(this).removeClass("date_today");
    		    	$(this).addClass("date_today");
    	    	}
    	    	
    	    	/* 몇월 몇주 날짜 범위 출력 */
    	    	var weekAndMonth = new Date($(".chart1").find(".date").not(".test").next().val());
    	    	var month = weekAndMonth.getMonth()+1;
    	    	var week = Math.ceil((weekAndMonth.getDate() + weekAndMonth.getDay()) / 7);
    	    	var txt = month+"월"+week+"주";
    	    	$("#month_week").text(txt);
    	    	
    			var selectDate = $(".chart1").find(".date").not(".test").next().val();
    			var currentDate = new Date(selectDate);
    			currentDate.setDate(currentDate.getDate() - 6);
    			
    			var year = currentDate.getFullYear();
    			var month = currentDate.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줌
    			var day = currentDate.getDate();
    			
    			var sixDaysAgo = ('0'+year).slice(-2) + '.' + ('0' + month).slice(-2) + '.' + ('0' + day).slice(-2);
    	    	
    			targetDate = selectDate.split("-").join(".").slice(2);
    			
    			// week
    	    	$("#week_range").text(sixDaysAgo+"~"+targetDate);
    			
    	    	// Month
    			var m = $(".chart2").find(".date_today > p:eq(0)").text();
    	    	$("#month_range").text(m);
    	    	
    	    	$(".chart").removeClass("hide");
    	    	
    	    	var mbIdx = $("#memId").val();
    	    	var petIdx = $("#petId").val();

            }
            
            /* 오늘 이외의 날짜 클릭시 이벤트 */
            var changeDateNotToday = function(){
    	    	if($(this).hasClass("date_today")===true){
    	    		e.preventDefault();
    	    	} else{
    		    	$(".date").not(this).removeClass("date_today");
    		    	$(this).addClass("date_today");
    	    	}
    	    	
    	    	/* 몇월 몇주 날짜 범위 출력 */
    	    	var weekAndMonth = new Date($(this).next().val());
    	    	var month = weekAndMonth.getMonth()+1;
    	    	var week = Math.ceil((weekAndMonth.getDate() + weekAndMonth.getDay()) / 7);
    	    	var txt = month+"월"+week+"주";
    	    	$("#month_week").text(txt);
    	    	
    			var selectDate = $(".chart1").find(".date").not(".test").next().val();
    			var currentDate = new Date(selectDate);
    			currentDate.setDate(currentDate.getDate() - 6);
    			
    			var year = currentDate.getFullYear();
    			var month = currentDate.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줌
    			var day = currentDate.getDate();
    			
    			var sixDaysAgo = ('0'+year).slice(-2) + '.' + ('0' + month).slice(-2) + '.' + ('0' + day).slice(-2);
    	    	
    			targetDate = selectDate.split("-").join(".").slice(2);
    			
    			// week
    	    	$("#week_range").text(sixDaysAgo+"~"+targetDate);
    			
    	    	// Month
    			var m = $(".chart2").find(".date_today > p:eq(0)").text();
    	    	$("#month_range").text(m);
    	    	
				$(".chart").addClass("hide");
				
				$(".modal").removeClass("hide");
				$(".btn_close").click(function(){
					$(".modal").addClass("hide");
				});
				
				$(".modal").click(function(){
					$(".modal").addClass("hide");
				});
            }
            
            // 날짜 클릭시
            $(".chart1").find(".test").on("click", changeDate);
            // 오늘 이외의 날짜 클릭시 모달 창 출력
    	    $(".chart1").find(".date").not(".test").on("click", changeDateNotToday);
            
    	    $(".chart2").find(".test").on("click", changeDate);
    	    $(".chart2").find(".date").not(".test").on("click", changeDateNotToday);
    	    
            
            /* weekly-total */
    	    var chrt = $("#totalWeeklyChart");
        	var totalWeeklyChart = new Chart(chrt, {
        		type:"polarArea",
        		data:{
        			labels:['그루밍', '피부 긁음', '재채기', '식사', '배변', '구토', '써클링', '개구호흡', '발작', '후지마비'],
        			datasets:[{
        				label:"weekly-total",
        				data:[22, 32, 16, 84, 29, 3, 0, 1, 0, 0],
        				backgroundColor: ['#fdE0dd', '#fcc5c0', '#fa9fb5', '#f768a1', '#DD3497', '#AE017E', 
	                        '#7A0177', '#49006A', '#240134', '#000000'],
        			}],
        		},
        		options:{
        			responsive: true,
        			plugins:{
        				legend:{
        					display:true,
        					labels:{
        						color:"rgb(94, 94, 94)",
        						boxWidth:10,
        						boxHeight:10,
        						font:{size:13}
        					}
        				}
        			}
        		}
        	});
        	
        	/* monthly-total */
        	var chrt2 = $("#totalMonthlyChart");
        	var totalMonthlyChart = new Chart(chrt2, {
        		type:"polarArea",
        		data:{
        			labels:['그루밍', '피부 긁음', '재채기', '식사', '배변', '구토', '써클링', '개구호흡', '발작', '후지마비'],
        			datasets:[{
        				label:"weekly-total",
        				data:[89, 50, 90, 84, 120, 6, 0, 1, 0, 0],
        				backgroundColor: ['#e0f3db', '#ccebc5', '#a8ddb5', '#7bccc4', '#4eb3d3', '#2b8cbe', 
	                        '#0868ac', '#084081', '#00234b', '#000000'],
        			}],
        		},
        		options:{
        			responsive: true,
        			plugins:{
        				legend:{
        					display:true,
        					labels:{
        						color:"rgb(94, 94, 94)",
        						boxWidth:10,
        						boxHeight:10,
        						font:{size:13}
        					}
        				}
        			}
        		}
        	});
        	
        	/* 카테고리별 차트 */
        	for(var i = 0; i < 10; i++){
        		var label = ['그루밍', '피부 긁음', '재채기', '식사', '배변', '구토', '써클링', '개구호흡', '발작', '후지마비'];
        		var datas = [[3.03, 2.36, 3.41, 2.47, 3.44, 4.07, 3.38], [5, 2, 6, 5, 3, 8, 3], [3, 5, 4, 2, 1, 0, 1], 
        					 [13, 12, 10, 9, 15, 14, 11], [5, 4, 4, 3, 6, 3, 4],[0, 2, 0, 0, 1, 0, 0], [0, 0, 0, 0, 0, 0, 0], 
        					 [0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0]];
        		var max = [8, 30, 30, 20, 20, 20, 20, 20, 10, 10];
        		
        		var chrt = $("#weeklyChart"+i);
				var weeklyChart =  new Chart(chrt, {
					type: 'bar',
					data: {
						labels: ['월', '화', '수', '목', '금', '토', '일'],
						datasets: [{
							label: label[i],
							data: datas[i],
							backgroundColor: 'rgba(205, 0, 0, 0.5)'
						}]
					},
					options: {
						plugins:{
							legend: {
								display:false
							}
						},
						scales: {
							y:{
								max: max[i],
								beginAtZero: true
							}
						}
					}
				});
				
				var datas2 = [[3.03, 2.36, 3.41, 2.47, 3.44], [5, 2, 6, 5, 3], [3, 5, 4, 2, 1], [13, 12, 10, 9, 15], [5, 4, 4, 3, 6], 
					[0, 2, 0, 0, 1], [0, 0, 0, 0, 0], [0, 0, 0, 0, 1], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]]
        		var chrt2 = $("#monthlyChart"+i);
				var monthlyChart =  new Chart(chrt2, {
					type: 'line',
					data: {
						labels: ['1주', '2주', '3주', '4주', '5주'],
						datasets: [{
							label: 'category-monthly',
							data: datas2[i],
							backgroundColor: 'rgba(78, 179, 211, 0.7)'
						}]
					},
					options: {
						plugins:{
							legend: {
								display:false
							}
						},
						scales: {
							y:{
								max: max[i],
								beginAtZero: true
							}
						}
					}
				});
        	}
        });
    </script>
</body>
</html>