<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*"%>
<%@ page import="java.text.DecimalFormat"%>

<script language = "javascript"> // �ڹ� ��ũ��Ʈ ����

function writeCheck()
  {
   var form = document.writeform;
   
   if( !form.title.value )
   {
    alert( "������ �����ּ���" );
    form.title.focus();
    return;
   }
   
   if( !form.name.value )   // form �� �ִ� name ���� ���� ��
   {
    alert( "�̸��� �����ּ���" ); // ���â ���
    form.name.focus();   // form �� �ִ� name ��ġ�� �̵�
    return;
   }
   
   if( !form.password.value )
   {
    alert( "��й�ȣ�� �����ּ���" );
    form.password.focus();
    return;
   }
   
  if( !form.memo.value )
   {
    alert( "������ �����ּ���" );
    form.memo.focus();
    return;
   }
 
  form.submit();
  }
 </script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ü ���� ���</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="bootstrap.vertical-tabs.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

</head>
<body>
 <jsp:include page="master/NewFile.jsp"></jsp:include>
 <h1>&nbsp;</h1>
<form name=writeform method=post action="write_ok.jsp">
<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      <td>�۾���</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">����</td>
      <td><input name="title" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">�̸�</td>
      <td><input name="name" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">��й�ȣ</td>
      <td><input type="password" name="password" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">����</td>
      <td><textarea name="memo" cols="50" rows="13"></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=button value="���" OnClick="javascript:writeCheck();">
       <input type=button value="���" OnClick="javascript:history.back(-1);">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</form>

</body>
</html>