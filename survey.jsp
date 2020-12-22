<%-- 
    Document   : survey
    Created on : 29 Nov, 2020, 11:57:50 PM
    Author     : uditc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Survey Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="style.css">
        <script>
            function checkDays()
            {
                var days=document.myForm.Duration.value;
                if(days<0)
                {
                    document.myForm.Duration.value=0;
                }
            }
        </script>
    </head>
    <body>
        <jsp:include page="Header.jsp" />
        <div class="container">
            <div class="SurveyHeading">
            <h1>Personalized Recommendation</h1>
            <h3>Please Provide The Following Information To Get A Personalized Recommendation</h3>
            <form action="" name="myForm" class="SurveyForm">
                    <div class="SurveyQues">
                            <label>Budget :</label><br>
                            <input type="number" name="Budget" placeholder="Enter your budget" required>
                    </div>
                    <div class="SurveyQues">
                        <label onchange="checkDays()">Duration :</label><br>
                            <input type="number" name="Duration" placeholder="Enter total days of travel" required>
                    </div>
                    <div class="SurveyQues">
                    <label>Time of Travel :</label><br>
                            <span>From:</span>
                            <select name="From" required>
                                    <option>January</option>
                                    <option>February</option>
                                    <option>March</option>
                                    <option>April</option>
                                    <option>May</option>
                                    <option>June</option>
                                    <option>July</option>
                                    <option>August</option>
                                    <option>September</option>
                                    <option>October</option>
                                    <option>November</option>
                                    <option>December</option>
                            </select>
                            <br>
                            <span>To:</span>
                            <select name="To" required>
                                    <option>January</option>
                                    <option>February</option>
                                    <option>March</option>
                                    <option>April</option>
                                    <option>May</option>
                                    <option>June</option>
                                    <option>July</option>
                                    <option>August</option>
                                    <option>September</option>
                                    <option>October</option>
                                    <option>November</option>
                                    <option>December</option>
                            </select>
                    </div>
                    <div class="SurveyQues">
                            <label>Religious Interest (</label>
                            <input type="radio" value="0" name="ReligiousInterestImp" required><span class="SurveyRadio">Not Important At All</span>
                            <input type="radio" value="0.5" name="ReligiousInterestImp"><span class="SurveyRadio">Not That Important</span>
                            <input type="radio" value="1" name="ReligiousInterestImp"><span class="SurveyRadio">Neutral</span>
                            <input type="radio" value="1.5" name="ReligiousInterestImp"><span class="SurveyRadio">Somewhat Important</span>
                            <input type="radio" value="2" name="ReligiousInterestImp"><span class="SurveyRadio">Very Important )</span>
                            <br>
                            <input type="radio" value="-1" name="ReligiousInterest" required><span class="SurveyRadio">Non Religious</span><br>
                            <input type="radio" value="1" name="ReligiousInterest"><span class="SurveyRadio">Religious</span>
                    </div>
                    <div class="SurveyQues">
                            <label>Type of Traveler (</label>
                            <input type="radio" value="0" name="TypeOfTravelerImp" required><span class="SurveyRadio">Not Important At All</span>
                            <input type="radio" value="0.5" name="TypeOfTravelerImp"><span class="SurveyRadio">Not That Important</span>
                            <input type="radio" value="1" name="TypeOfTravelerImp"><span class="SurveyRadio">Neutral</span>
                            <input type="radio" value="1.5" name="TypeOfTravelerImp"><span class="SurveyRadio">Somewhat Important</span>
                            <input type="radio" value="2" name="TypeOfTravelerImp"><span class="SurveyRadio">Very Important )</span>
                            <br>
                            <input type="radio" value="-1" name="TypeOfTraveler" required><span class="SurveyRadio">Conventional Traveler</span><br>
                            <input type="radio" value="1" name="TypeOfTraveler"><span class="SurveyRadio">Adventurous Traveler</span>
                    </div>
                    <div class="SurveyQues">
                            <label>State of Destination (</label>
                            <input type="radio" value="0" name="StateOfDestinationImp" required><span class="SurveyRadio">Not Important At All</span>
                            <input type="radio" value="0.5" name="StateOfDestinationImp"><span class="SurveyRadio">Not That Important</span>
                            <input type="radio" value="1" name="StateOfDestinationImp"><span class="SurveyRadio">Neutral</span>
                            <input type="radio" value="1.5" name="StateOfDestinationImp"><span class="SurveyRadio">Somewhat Important</span>
                            <input type="radio" value="2" name="StateOfDestinationImp"><span class="SurveyRadio">Very Important )</span>
                            <br>
                            <input type="radio" value="-1" name="StateOfDestination" required><span class="SurveyRadio">Volatile / Commotional</span><br>
                            <input type="radio" value="1" name="StateOfDestination"><span class="SurveyRadio">Peaceful / Tranquil</span>
                    </div>
                    <div class="SurveyQues">
                            <label>Type of Destination (</label>
                            <input type="radio" value="0" name="TypeOfDestinationImp" required><span class="SurveyRadio">Not Important At All</span>
                            <input type="radio" value="0.5" name="TypeOfDestinationImp"><span class="SurveyRadio">Not That Important</span>
                            <input type="radio" value="1" name="TypeOfDestinationImp"><span class="SurveyRadio">Neutral</span>
                            <input type="radio" value="1.5" name="TypeOfDestinationImp"><span class="SurveyRadio">Somewhat Important</span>
                            <input type="radio" value="2" name="TypeOfDestinationImp"><span class="SurveyRadio">Very Important )</span>
                            <br>
                            <input type="radio" value="-1" name="TypeOfDestination" required><span class="SurveyRadio">Fun Activities</span><br>
                            <input type="radio" value="1" name="TypeOfDestination"><span class="SurveyRadio">Scenic Beauty</span>
                    </div>
                    <div class="SurveyQues">
                            <input type="submit" >
                    </div>
            </form>
            </div>
    </div>  
        <jsp:include page="footer.jsp" />
    </body>
</html>
