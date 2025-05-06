<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    class Question {
        String question, option1, option2, option3, option4, correct, suggestion;
        Question(String q, String o1, String o2, String o3, String o4, String c, String s) {
            question = q; option1 = o1; option2 = o2; option3 = o3; option4 = o4;
            correct = c; suggestion = s;
        }
    }

    List<Question> allQuestions = new ArrayList<>();
    allQuestions.add(new Question("Which food is healthier?", "Burger", "Pizza", "Salad", "Fries", "Salad", "Choose vegetables over processed fried food."));
    allQuestions.add(new Question("How much water should an adult drink daily?", "1 liter", "2 liters", "4 liters", "5 liters", "2 liters", "Aim for about 2 liters (8 glasses) per day."));
    allQuestions.add(new Question("What is a good time to workout?", "After dinner", "Late night", "Morning", "Midnight", "Morning", "Morning workouts improve consistency."));
    allQuestions.add(new Question("Which activity burns the most calories?", "Watching TV", "Walking", "Running", "Sitting", "Running", "Cardio exercises like running burn more calories."));
    allQuestions.add(new Question("Best way to reduce belly fat?", "Sit-ups", "Spot training", "Healthy diet + cardio", "Only weights", "Healthy diet + cardio", "Fat loss requires full-body work."));
    allQuestions.add(new Question("What helps muscle growth?", "Protein", "Sugar", "Fat", "Caffeine", "Protein", "Protein is essential for muscle repair and growth."));
    allQuestions.add(new Question("Is skipping breakfast healthy?", "Yes", "No", "Sometimes", "Always", "No", "Breakfast gives energy and supports metabolism."));
    allQuestions.add(new Question("Which snack is better for weight loss?", "Chips", "Fruits", "Cake", "Ice cream", "Fruits", "Fruits are low-calorie and nutritious."));

    Collections.shuffle(allQuestions);
    List<Question> quizQuestions = allQuestions.subList(0, 5);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Health & Fitness Quiz</title>
</head>
<body style="font-family:sans-serif; background:#eafaf1; padding:40px;">
    <div style="max-width:800px; margin:auto; background:white; padding:30px; border-radius:15px; box-shadow:0 0 10px rgba(0,0,0,0.1);">
        <h1 style="text-align:center; color:#2e7d32;">💪 Health & Fitness Quiz</h1>
        <%
            if(request.getMethod().equalsIgnoreCase("POST")) {
                int score = 0;
                for(int i=0; i<5; i++) {
                    String userAns = request.getParameter("ans" + i);
                    Question q = quizQuestions.get(i);
                    boolean correct = q.correct.equals(userAns);
                    if(correct) score++;
        %>
                <div style="margin-bottom:20px;">
                    <p><b>Q<%=i+1%>. <%=q.question%></b></p>
                    <p>Your Answer: <%=userAns != null ? userAns : "No answer"%> <%=correct ? "✅" : "❌"%></p>
                    <% if(!correct) { %>
                        <p>Correct Answer: <b><%=q.correct%></b></p>
                    <% } %>
                    <p style="color:gray;"><i>Tip: <%=q.suggestion%></i></p>
                </div>
        <%
                }
        %>
            <h2 style="text-align:center;">🎯 Final Score: <%=score%> / 5</h2>
            <%
                if(score == 5){
            %><p style="text-align:center; color:green;">Perfect! You're a health hero!</p><%
                } else if(score >= 3){
            %><p style="text-align:center; color:orange;">Good job! Keep learning and improving.</p><%
                } else {
            %><p style="text-align:center; color:red;">Keep practicing for better health habits!</p><%
                }
            %>
            <div style="text-align:center; margin-top:20px;">
                <a href="playgame.jsp" style="background:#4CAF50; color:white; padding:10px 20px; border-radius:8px; text-decoration:none;">Try Again</a>
            </div>
        <%
            } else {
        %>
        <form method="post">
            <%
                for(int i=0; i<5; i++) {
                    Question q = quizQuestions.get(i);
            %>
                <div style="margin-bottom:25px;">
                    <p style="font-size:18px;"><b>Q<%=i+1%>. <%=q.question%></b></p>
                    <label><input type="radio" name="ans<%=i%>" value="<%=q.option1%>" required /> <%=q.option1%></label><br>
                    <label><input type="radio" name="ans<%=i%>" value="<%=q.option2%>" /> <%=q.option2%></label><br>
                    <label><input type="radio" name="ans<%=i%>" value="<%=q.option3%>" /> <%=q.option3%></label><br>
                    <label><input type="radio" name="ans<%=i%>" value="<%=q.option4%>" /> <%=q.option4%></label>
                </div>
            <%
                }
            %>
            <div style="text-align:center;">
                <button type="submit" style="background:#2e7d32; color:white; padding:12px 24px; border:none; border-radius:8px; font-size:16px; cursor:pointer;">Submit</button>
            </div>
        </form>
        <%
            }
        %>
    </div>
</body>
</html>
