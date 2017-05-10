<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:wkdoc="http://www.wkpublisher.com/xml-namespaces/document">

<xsl:output method="html" doctype-system="about:legacy-compat" />

<xsl:template match="//wkdoc:document">
	<html>
	  <head>
	    <meta charset="utf-8" />
	    <title>Task 4</title>
	    <style>
	    h1 {
			letter-spacing: 0.2ex;
	    }
	    body {
			background-color: white;
	    }
	    .scms_name_dashboard-display {
			border-radius: 10px;
			background-color: lightgrey;
			padding: 1em;
			letter-spacing: 0.3ex;
	    }
	    .va-related-matter {
			box-shadow: 0 0 40px rgba(0,0,0,0.5);
			margin: 40px 60px 0;
	    }
	    .related-matter-title {
			background-color: #3BABC2;
			color: white;
			padding: 0.5em;
	    }
	    .related-matter-img {
			height: 1.2em;
			float: left;
			margin: 0 0.6em;
	    }
	    .hint-arrow {
			border: 20px solid transparent; 
			border-left: 20px solid; 
			border-top: 20px solid; 
	    }
	    .scms_heading {
			font-weight: bold;
	    }
	    </style>
	  </head>
	  <body>
	    <xsl:apply-templates />
	  </body>
	</html>
</xsl:template>


<xsl:template match="//wkdoc:level[@css-class='scms_extensible-metadata']">
	<xsl:apply-templates select=".//wkdoc:level[@css-class='scms_metadata-item scms_name_title']" />
	<xsl:apply-templates select=".//wkdoc:level[@css-class='scms_metadata-item scms_name_dashboard-display']" />
</xsl:template>

<xsl:template match="//wkdoc:level[@css-class='scms_metadata-item scms_name_title']">
	<h1>
		<xsl:value-of select="./para" />
	</h1>
</xsl:template>

<xsl:template match="//wkdoc:level[@css-class='scms_metadata-item scms_name_dashboard-display']">
	<div class="scms_name_dashboard-display">
		<xsl:value-of select="./para" />
	</div>
</xsl:template>

<xsl:template match="//wkdoc:level[@css-class='scms_va-object_sub-class_key-references scms_va-object_area_va-related-matter']">
	<div class="va-related-matter">
		<div class="related-matter-title">
			<img class="related-matter-img" src="related-matter.png"/>
			<xsl:apply-templates select="./h1" />
		</div>
		<xsl:apply-templates select="* except ./h1"/>
	</div>
</xsl:template>

<xsl:template match="//h1">
	<span class="{string(@css-class)}">
		<xsl:value-of select="." />
	</span>
</xsl:template>


</xsl:stylesheet>
