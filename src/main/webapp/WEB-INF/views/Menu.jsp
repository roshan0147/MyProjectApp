<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="base">${pageContext.request.requestURL}</c:set>
<c:set var="url"
	value="${fn:replace(base, pageContext.request.requestURI, pageContext.request.contextPath)}" />

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
 -->
<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css">
<script src="../resources/bootstrap/js/jquery-3.2.1.min.js"></script>
<script src="../resources/bootstrap/js/popper.min.js"></script>
<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
<nav class="navbar navbar-expand-lg navbar-light bg-info">
  <a class="navbar-brand" href="#">WAREHOUSE</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">HOME <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          ShipmentType
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="${url}/shipment/all">Shipment Data</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="${url}/shipment/charts">Charts</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="${url}/shipment/register">Register</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Uom
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="${url}/uom/all">Uom Data</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="${url}/uom/charts">Charts</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="${url}/uom/register">Register</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          OrderMethod
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="${url}/ordermethod/all">OrderMethod Data</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="${url}/ordermethod/charts">Charts</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="${url}/ordermethod/register">Register</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          WhUserType
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="${url}/user/all">WhUserType Data</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="${url}/user/charts">Charts</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="${url}/user/register">Register</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Part
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="${url}/part/all">Part Data</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="${url}/part/charts">Charts</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="${url}/part/register">Register</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Purchase
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="${url}/purchaseOrder/all">Purchase Data</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="${url}/purchaseOrder/charts">Charts</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="${url}/purchaseOrder/register">Register</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Sale
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="${url}/saleOrder/all">Sale Data</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="${url}/saleOrder/charts">Charts</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="${url}/saleOrder/register">Register</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Grn
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="${url}/grn/all">Sale Data</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="${url}/grn/charts">Charts</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="${url}/grn/register">Register</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Document
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="${url}/document/show">Upload</a>
          </div>
      </li>
    </ul>
    <form class="form-inline" action="/action_page.php">
    <input class="form-control" type="text" placeholder="Search">
    <button class="btn btn-success" type="submit">Find</button>
  </form>
  </div>
</nav>