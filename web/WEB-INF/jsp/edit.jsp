<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="ru.javawebinar.basejava.model.ContactType" language="java" %>
<%@ page import="ru.javawebinar.basejava.model.SectionType" language="java" %>
<%@ page import="ru.javawebinar.basejava.util.HtmlMapper" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html charset=UTF-8" pageEncoding="UTF-8">
    <link rel="stylesheet" href="css/style.css">
    <jsp:useBean id="resume" type="ru.javawebinar.basejava.model.Resume" scope="request"/>
    <title>Резюме ${resume.fullName}</title>
</head>
<body>
<jsp:include page="fragments/header.jsp"/>
<section>
    <form method="post" action="resume" enctype="application/x-www-form-urlencoded">
        <input type="hidden" name="uuid" value="${resume.uuid}">
          <dl>
              <dt>Имя:</dt>
              <dd><input type="text" name="fullName" size=50 value="${resume.fullName}"></dd>
          </dl>
          <h3>Контакты</h3>
          <p>
                <c:forEach var="type" items="<%=ContactType.values()%>">
                <dl>
                  <dt>${type.title}</dt>
                  <dd><input type="text" name="${type.name()}" size=30 value="${resume.getContact(type)}"></dd>
                </dl>
                </c:forEach>
          </p>
          <h3>Секции:</h3>
          <p>
              <c:forEach var="type" items="<%=SectionType.values()%>">
                  <c:choose>
                      <c:when test="${resume.getSection(type) == null}">
                           ${HtmlMapper.toEmptyHtml(type)}
                      </c:when>
                      <c:otherwise>
                          ${HtmlMapper.toEditableHtml(type, resume.getSection(type))}
                      </c:otherwise>
                  </c:choose>
                          <div style="margin-bottom: 30px"></div>
              </c:forEach>
          </p>
          <hr>
          <button type="submit">Сохранить</button>
          <button onclick="window.history.back()">Отменить</button>
    </form>
</section>
<jsp:include page="fragments/footer.jsp"/>
</body>
</html>
