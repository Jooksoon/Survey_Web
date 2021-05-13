<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="DB.connection.DBConnection" %>
<%!
    public int nullIntconvert(String str) {
        int num = 0;
        if (str == null) {
            str = "0";
        } else if ((str.trim()).equals("null")) {	// trim: 문자열 공백 제거
        											// 공백 제거한 결과가 null이라면
            str = "0";	// 문자열의 값을 0으로
        } else if (str.equals("")) {	// 그냥 값이 없으면
            str = "0";	// 그때도 0으로
        }
        try {
            num = Integer.parseInt(str);
        } catch (Exception e) {
        }
        return num;
    }
%>
<%
    Connection conn = DBConnection.getConnection();
	
	conn.setAutoCommit(false);
	
    ResultSet rs1 = null;
    ResultSet rs2 = null;
    PreparedStatement ps1 = null;
    PreparedStatement ps2 = null;
	
    int showRows = 10;
    int totalRecords = 5;
    int totalRows = nullIntconvert(request.getParameter("totalRows"));
    int totalPages = nullIntconvert(request.getParameter("totalPages"));
    int iPageNo = nullIntconvert(request.getParameter("iPageNo"));
    int cPageNo = nullIntconvert(request.getParameter("cPageNo"));

    int startResult = 0;
    int endResult = 0;
    int ques = 1;
    int no = 1;
    if (iPageNo == 0) {
        iPageNo = 0;
    } else {
        iPageNo = Math.abs((iPageNo - 1) * showRows);
    }
    String tablename = "user";
    String query1 = "SELECT SQL_CALC_FOUND_ROWS * FROM " + tablename + " limit " + iPageNo + "," + showRows + "";
    ps1 = conn.prepareStatement(query1);
    rs1 = ps1.executeQuery();

    String query2 = "SELECT FOUND_ROWS() as cnt";
    ps2 = conn.prepareStatement(query2);
    rs2 = ps2.executeQuery();
    if (rs2.next()) {
        totalRows = rs2.getInt("cnt");
    }
%>
<!DOCTYPE html>
<html>
<head>
	<title>폴인사이트_관리자</title>
	<link href="/css/mnms.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		#mnm:hover{
		    background-color: #333;
		    color: #fff;
		}
		#mns{
		    background-color: tomato;
		    color: #fff;
		}
		#mkf:hover{
		background-color: #333;
		    color: #fff;
		}
	</style>
	<script type="text/javascript">
function makeForm(){
	window.name="parentForm";
	window.open("formInfo.jsp", "chkForm",
	"width=500 height=300 resizableno, scrollbars=no");
}
</script>
</head>
<body>
    <div class="sidebar">
		<div>
			<a id="mnm" href="managePanel.jsp">회원관리</a>
		</div>
		<div>
			<a id="mns" href="manageSurvey.jsp">설문관리</a>
		</div>
		<div>
			<a  id="mkf" onclick="makeForm()">설문제작</a>
		</div>
	</div>
    <div class="main">
       <h2>설문 관리</h2>
       <hr>
       <div class="searchbar"">
           <form class="searchbar-form"> 
               <fieldset>
                      <legend>검색</legend>
                      <select name="searchbar-select">
                          <option value="name">회원이름</option>
                          <option value="age">나이</option>
                      </select>
                      <input type="search" id="query" name="q" placeholder="회원조회" autocomplete="off" spellcheck="false" style="margin:auto; max-width:400px"><button type="submit"><i class="fa fa-search" style="display: inline-block"></i></button>
                  </fieldset>
           </form>
        </div>	
        <div class="surveylist">
		<table class="surveylist-table">
			<colgroup>
				<col width="20%">
				<col width="20%">
				<col width="20%">
				<col width="10%">
				<col width="20%">
				<col width="10%">
			</colgroup>
			<thead class="thead-light">
				<tr>
					<th scope="col">NO</th>
					<th scope="col">ID</th>
					<th scope="col">이름</th>
					<th scope="col">패널 여부</th>
					<th scope="col">응답률</th>
					<th scope="col">상세</th>
				</tr>
			</thead>
			<tbody>
            <%
                while (rs1.next()) {
            %>	
            <tr>
            	<td><%=iPageNo+no%></td>
                <td><%=rs1.getString("ID")%></td>
                <td><%=rs1.getString("NAME")%></td>
                <td><%=rs1.getString("TYPE")%></td>
                <td>%</td>
				<td><input type="button" value="상세" onclick="location.href='#'"></td>
            </tr>
            <%
                    ques++;
    				no++;
                }
            %>
            </tbody>
          </table>
        </div><br>
        <div class="surveynav">
	        <form class="surveynav-form">
	           <input type="hidden" name="iPageNo" value="<%=iPageNo%>">
	           <input type="hidden" name="cPageNo" value="<%=cPageNo%>">
	           <input type="hidden" name="showRows" value="<%=showRows%>">
	           <%
	               try {
	                   if (totalRows < (iPageNo + showRows)) {
	                       endResult = totalRows;
	                   } else {
	                       endResult = (iPageNo + showRows);
	                   }
	                   startResult = (iPageNo + 1);
	                   totalPages = ((int) (Math.ceil((double) totalRows / showRows)));
	               } catch (Exception e) {
	                   e.printStackTrace();
	               }
	               int i = 0;
	               int cPage = 0;
	               if (totalRows != 0) {
	                   cPage = ((int) (Math.ceil((double) endResult / (totalRecords * showRows))));
	
	                   int prePageNo = (cPage * totalRecords) - ((totalRecords - 1) + totalRecords);
	                   if ((cPage * totalRecords) - (totalRecords) > 0) {	//현재 페이지 * 한 화면에 보일 최대 페이지 수 - 한 화면에 보일 최대 페이지 수
	           %>
	           <span id="prev"><a href="mnm.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>" class="prev-span" style="text-decoration:none;">&lt;</a></span>
	           <%
	               }
	               for (i = ((cPage * totalRecords) - (totalRecords - 1)); i <= (cPage * totalRecords); i++) {
	                   if (i == ((iPageNo / showRows) + 1)) {%>
	           <span class="numbers"><a href="mnm.jsp?iPageNo=<%=i%>" class="number-span1" style="text-decoration:none;"><%=i%></a></span>
	               <%
	               } else if (i <= totalPages) {
	               %>
	           <span class="numbers"><a href="mnm.jsp?iPageNo=<%=i%>" class="number-span2" style="text-decoration:none;"><%=i%></a></span>
	               <%
	                       }
	                   }
	                   if (totalPages > totalRecords && i < totalPages) {
	               %>
	           <span id="next"><a href="mnm.jsp?iPageNo=<%=i%>&cPageNo=<%=i%>" class="next-span" style="text-decoration:none;">&gt;</a></span>
	           <%
	                   }
	               }
	               conn.close();
	
	               conn = null;
	               rs1 = null;
	               rs2 = null;
	               ps1 = null;
	               ps2 = null;
	               query1 = null;
	               query2 = null;
	           %>
	        </form><br>
		</div>
	</div>
</body>
</html>