<%@ page import="java.util.*" %>
<%
    class Match {
        String left, right, correct, tip;
        Match(String l, String r, String c, String t) {
            left = l; right = r; correct = c; tip = t;
        }
    }

    List<Match> allPairs = new ArrayList<>();
    allPairs.add(new Match("🥬 Spinach", "Iron Boost", "Iron Boost", "Leafy greens increase hemoglobin."));
    allPairs.add(new Match("🥕 Carrots", "Vitamin A", "Vitamin A", "Great for vision and skin."));
    allPairs.add(new Match("🥛 Milk", "Calcium", "Calcium", "Strengthens bones and teeth."));
    allPairs.add(new Match("🍌 Banana", "Potassium", "Potassium", "Good for muscles and cramps."));
    allPairs.add(new Match("🍓 Berries", "Antioxidants", "Antioxidants", "Help fight inflammation."));

    Collections.shuffle(allPairs);
    List<Match> matchQs = allPairs.subList(0, 5);

    List<String> rightOptions = new ArrayList<>();
    for(Match m : matchQs) {
        rightOptions.add(m.correct);
    }
    Collections.shuffle(rightOptions);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Match Health Pairs</title>
</head>
<body style="font-family:sans-serif; background:#f0f8ff; padding:40px;">
    <div style="max-width:900px; margin:auto; background:white; padding:30px; border-radius:15px; box-shadow:0 0 15px rgba(0,0,0,0.1);">
        <h1 style="text-align:center; color:#00695c; border-bottom:2px solid #ccc; padding-bottom:10px;">🧠 Match the Health Pairs</h1>

        <%
            if(request.getMethod().equalsIgnoreCase("POST")) {
                int score = 0;
        %>
        <div style="margin-top:20px;">
            <% for(int i=0; i<5; i++) {
                String userAns = request.getParameter("match" + i);
                Match m = matchQs.get(i);
                boolean correct = m.correct.equals(userAns);
                if(correct) score++;
            %>
            <div style="margin-bottom:15px; padding:10px; background:<%=correct ? "#e8f5e9" : "#ffebee"%>; border-radius:10px;">
                <b><%=m.left%></b> → You chose: <%=userAns%> <%=correct ? "✅" : "❌"%><br/>
                <% if(!correct) { %>
                    Correct: <b><%=m.correct%></b><br/>
                <% } %>
                <small style="color:#555;">💡 <%=m.tip%></small>
            </div>
            <% } %>
        </div>
        <h2 style="text-align:center; color:#2e7d32;">🎯 Your Score: <%=score%> / 5</h2>
        <div style="text-align:center; margin-top:20px;">
            <a href="matchgame.jsp" style="background:#43a047; color:white; padding:10px 20px; border-radius:8px; text-decoration:none;">Try Again 🔄</a>
        </div>

        <% } else { %>

        <form method="post" style="margin-top:30px;">
            <div style="display:flex; justify-content:space-between;">
                <div>
                    <h3 style="color:#00695c;">Health Items</h3>
                    <% for(int i=0; i<5; i++) { %>
                        <div style="margin-bottom:20px;">
                            <span style="display:inline-block; padding:10px; background:#e1f5fe; border-radius:10px; width:150px; text-align:center;">
                                <%=matchQs.get(i).left%>
                            </span>
                        </div>
                    <% } %>
                </div>

                <div>
                    <h3 style="color:#00695c;">Match To</h3>
                    <% for(int i=0; i<5; i++) { %>
                        <div style="margin-bottom:20px;">
                            <select name="match<%=i%>" required style="padding:10px; border-radius:8px; width:180px; background:#f3e5f5;">
                                <option value="">Choose</option>
                                <% for(String opt : rightOptions) { %>
                                    <option value="<%=opt%>"><%=opt%></option>
                                <% } %>
                            </select>
                        </div>
                    <% } %>
                </div>
            </div>
            <div style="text-align:center; margin-top:30px;">
                <button type="submit" style="background:#00897b; color:white; padding:12px 30px; font-size:16px; border:none; border-radius:8px; cursor:pointer;">Submit ✅</button>
            </div>
        </form>

        <% } %>
    </div>
</body>
</html>
