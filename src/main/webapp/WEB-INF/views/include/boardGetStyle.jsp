<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#td_info {
  padding: .5em 1em;
  display: flex; 
  height : 40px;
  justify-content: space-between;
  text-align: center;
}

table {
  border: 1px #a39485 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 100%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
}

#dl_info{
  display: flex;
}

dt, dd {
  margin-right: 5px;
  text-align: center;
  white-space: nowrap;
}
  
thead {
  font-weight: bold;
  background: #f07039;
}

#th_head {
  color: #fff;
  font-size: 1.5em; 
}

th {
  vertical-align: middle;
}
  
#td_content {
  padding: 1em 0.8em;
  border-bottom: 1px solid rgba(0,0,0,.1);
  background: #fff;
  font-size: 1.3em;
}

</style>