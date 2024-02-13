<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#frmSearch {
  display: flex;
  align-items: center;
  justify-content: flex-start; /* 검색창을 왼쪽으로 이동 */
  height: 30px;
}

#frmSearch label {
  display: flex;
  font-size: 18px;
  margin-right: 5px;
  height: auto;
  text-align: center;
}

#frmSearch select {
  margin-right: 5px;
  height: 100%;
}

#frmSearch input[type="text"] {
  margin-right: 5px;
}

.board-row {
  cursor: pointer;
}
body {
  color: #666;
  font: 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;
}
table {
  border-collapse: separate;
  border-spacing: 0;
  width: 100%;
}
th,td {
  padding: 6px 15px;
}
th {
  background: #42444e;
  color: #fff;
  text-align: center;
  border-bottom: 1px solid #fff;
  border-right: 1px solid #fff;
}
tr:first-child th:first-child {
  border-top-left-radius: 6px;
  width: 8%;
}

th:nth-child(3), td:nth-child(3) {
  width: 13%;
}

th:nth-child(4), td:nth-child(4) {
  width: 10%;
}

th:nth-child(5), td:nth-child(5) {
  width: 8%;
}

tr:first-child th:last-child {
  border-top-right-radius: 6px;
  
}
td {
  border-right: 1px solid #c6c9cc;
  border-bottom: 1px solid #c6c9cc;
  text-align : center;
  line-height: 5px;
}
td:first-child {
  border-left: 1px solid #c6c9cc;
}

td:nth-child(2) {  /* 좌측 여백 추가 */
  text-align: left;
  padding-left: 10px !important; 
}

tr:nth-child(even) td {
  background: #eaeaed;
}
tr:last-child td:first-child {
  border-bottom-left-radius: 6px;
  
}
tr:last-child td:last-child {
  border-bottom-right-radius: 6px;
}
</style>   