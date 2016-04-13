<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" version="2.0">
    <xsl:include href="blockAndInlineElements.xsl"/>
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" name="html"/>
    <xsl:template match="/">     
        <xsl:call-template name="homePage"/>
        <xsl:call-template name="about"/>
        <xsl:for-each select="//travelSight">
            <xsl:variable name="siteId">
                <xsl:value-of select="@id"/>
            </xsl:variable>
            <xsl:call-template name="standardPage">
                <xsl:with-param name="siteId" select="$siteId"/>
                <xsl:with-param name="navType" select="'hierarchy'"/>
            </xsl:call-template>
            <xsl:call-template name="standardPage">
                <xsl:with-param name="siteId" select="$siteId"/>
                <xsl:with-param name="navType" select="'index'"/>
            </xsl:call-template>
            <xsl:call-template name="standardPage">
                <xsl:with-param name="siteId" select="$siteId"/>
                <xsl:with-param name="navType" select="'sequence'"/>
            </xsl:call-template>
        </xsl:for-each>
         
    </xsl:template>
    <xsl:template name="homePage">
        <xsl:result-document href="../HTML/default.html" format="html">
            <html>
                <head>
                    <title>M &amp; T Starting Point</title>
                </head>
                <body bgcolor="#D7D9DE"
                    style="font-size:19px">
                    <table border="0" cellpadding="10px" width="1050" align="center">
                        <tr>
                            <td colspan="2">
                                <xsl:call-template name="header"/>
                            </td>
                             
                        </tr>
                        <tr>
                            <td colspan='2'>
                                <xsl:call-template name="partialView"/>
                            </td>
                            
                        </tr>
                    </table>
                   
                    
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    <xsl:template name="about">
        <xsl:result-document href="../HTML/about.html" format="html">
        <html>
            <head>
                <title>About Page</title>
            </head>
            <body bgcolor="#D7D9DE"
                style="font-size:19px">
                <table border="0" cellpadding="10px" width="1050" align="center">
                    <tr>
                        <td colspan="2">
                            <xsl:call-template name="header"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h2>About</h2>
                        <p>
                        Author:<xsl:value-of select="//about/author"/>
                         </p>
                            <hr/>
                        <p>
                            <xsl:apply-templates select="//about/description"/>
                        </p>
                            <hr/>
                            <h3>sources</h3>
                            <xsl:for-each select="//sourceDefs/sourceDef">
                                <xsl:variable name="web" select="url"/>
                                <p><a href="{$web}">
                                    <xsl:value-of select="$web"/>
                                </a>
                                </p>
                            </xsl:for-each>
                        </td>
                    </tr>
                </table>
                
                
              
                
                
            </body>
        </html>
        </xsl:result-document>
    </xsl:template>
    <xsl:template name="standardPage">
        <xsl:param name="siteId"/>
        <xsl:param name="navType"/>
        <xsl:result-document href="../HTML/{$siteId}_{$navType}.html" format="html">
            <html xmlns="http://www.w3.org/1999/xhtml">
                <head>
                    <title>
                        <xsl:value-of select="title"/>
                    </title>
                </head>
                <body bgcolor="#D7D9DE"
                    style="font-size:19px">
                    <div>
                    <table border="0" cellpadding="10px" width="1050" align="center">
                        
                        <tr>
                            <td colspan="2">
                                <xsl:call-template name="header"/>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" width="20%" >
                                <xsl:choose>
                                    <xsl:when test="$navType = 'hierarchy'">
                                        <xsl:call-template name="hierarchy">
                                            <xsl:with-param name="siteId" select="$siteId"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:when test="$navType = 'index'">
                                        <xsl:call-template name="index">
                                            <xsl:with-param name="siteId" select="$siteId"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:when test="$navType = 'sequence'">
                                        <xsl:call-template name="sequence">
                                            <xsl:with-param name="siteId" select="$siteId"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                </xsl:choose>
                            </td>
                            <td valign="top" style="width:100px">
                                <xsl:call-template name="fullView">
                                    <xsl:with-param name="siteId" select="$siteId"/>
                                    <xsl:with-param name="navType" select="$navType"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        
                        
                    </table>
                </div>
                </body>
            </html>
        </xsl:result-document>

    </xsl:template>
    <xsl:template name="header">
        <div style="
            background-image:url('image/header1.jpg');
            width:100%; 
            background-size:cover;
            margin-top:0px;
            height:356px">
                <div style="text-align:center;
                    font-size:18px;
                    font-color:red;
                    height:70px">
                <a href="default.html">HOME</a> | <a href="about.html">ABOUT</a> | <a
                href="site1_index.html">A TO Z</a> | <a href="site1_hierarchy.html">LOCATE YOUR DESTINATION</a> | <a href="site1_sequence.html">TOUR ROUTE  </a>|
                </div>
            <div style="font-size:35px;
                font-family: Times New Roman;
                text-align:center">
                <xsl:value-of select="//about/title"/>
            </div>
        <br clear="all"/>
        
       </div>
    </xsl:template>
    <xsl:template name="fullView">
        <xsl:param name="siteId"/>
        <xsl:param name="navType"/>
        <xsl:for-each select="//travelSight[@id = $siteId]">
            <p style="font-size: 30px; font-face: ARIAL; font-weight:bold">
                <xsl:value-of select="title"/>
            </p> 
            Country: <xsl:value-of select="location/@country"/>
            <br/>
            Rank:<xsl:value-of select="@rank"/>
            <p/>
            <p>
                Tag:<xsl:value-of select="@tag"/>
            </p>
                <img src="image/{pictures/picture/@path}" height="300" width="300"/>
           
            <p><xsl:apply-templates select="description"/></p>
            <hr/>
            <b>People who have been to Maldives: </b>
            <xsl:for-each select="review">
                <ul>
                    
                    <li><xsl:value-of select="."/></li>
                </ul>
                reviewID:<xsl:value-of select="@id"/>
            </xsl:for-each>
            <hr/><b> Highlights:</b>
            <xsl:for-each select="highLight">
                <ul>
                    <li>
                        <xsl:value-of select="."/></li>
                </ul>
            </xsl:for-each>
            <hr/>
            <b>Things To Do: </b><xsl:for-each select="thingsToDo/thingToDo">
                <ul>
                    <li><xsl:value-of select="title"/></li>
                    <xsl:if test="telephone">telephone:<xsl:value-of select="telephone"/></xsl:if>
                    <xsl:if test="address">address:<xsl:value-of select="address"/></xsl:if>
                    <xsl:if test="gettingThere">gettingThere<xsl:value-of select="gettingThere"
                        /></xsl:if>
                    <xsl:if test="moreInfo">moreInfo:<xsl:value-of select="moreInfo"/></xsl:if>
                    <xsl:if test="openHours">openHours:<xsl:value-of select="openHours"/></xsl:if>
                </ul>
            </xsl:for-each>
            <hr/>
            <p> People who like this place also like to go to: <xsl:for-each
                    select="associations/siteRefId">
                    <xsl:variable name="asID">
                        <xsl:value-of select="."/>
                    </xsl:variable>
                    <a href="{$asID}_index.html">
                        <xsl:value-of select="//travelSight[@id = $asID]/title"/>
                        <xsl:text> </xsl:text>
                    </a>
                </xsl:for-each>
            </p>
            <hr/>
            <p> source: <xsl:for-each select="sources/sourceRefId">
                    <xsl:variable name="srID">
                        <xsl:value-of select="."/>
                    </xsl:variable>
                    <p><i><xsl:value-of select="//sourceDef[@id = $srID]/title"/></i>: 
                        <xsl:variable name="url" select="//sourceDef[@id = $srID]/url"/>
                        <a href="{$url}">
                            <xsl:value-of select="$url"/></a></p>
                </xsl:for-each>
            </p>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="partialView">
        <div style="
            width:100%">
            <!-- <xsl:value-of select="title"/>
            <p>Country: <xsl:value-of select="location/@country"/></p> 
            <img src="image/{pictures/picture/@path}" height="210px" width="280px"/>-->
            <br/>
            <xsl:for-each select="//travelSight">
                <div style="display:inline-table;
                    width:10%">
                    <a href="{@id}_index.html">
                        <img style="width:195px;
                        height:195px" src="image/{pictures/picture/@path}"/></a>
                    <div style="text-align:center;
                        font-size:20px"><xsl:value-of select="title"/>
                    </div>
                </div>
        </xsl:for-each>
        </div>
    </xsl:template>
    <xsl:template name="index">
        <xsl:param name="siteId"/>
        <h3>A to Z Search</h3>
        <xsl:for-each select="//travelSight">
            <xsl:sort select="title"/>
            <a href="{@id}_index.html">
                <p>
                    <xsl:value-of select="title"/>
                </p>
            </a>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="hierarchy">
        <xsl:param name="siteId"/>
        <h3>Locate Your Destination</h3>
        <xsl:for-each select="/travelSightbase/locations/location">
            <xsl:call-template name="doOneLine">
                <xsl:with-param name="indent" select="'10'"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="sequence">
        <xsl:param name="siteId"/> 
        <h3>Tour Route</h3> 
        <p>
            <xsl:for-each select="//sequence/siteRefId">
                <p>
                    <xsl:variable name="asID">
                        <xsl:value-of select="."/>
                    </xsl:variable>
                    <a href="{$asID}_sequence.html">
                        <xsl:value-of select="//travelSight[@id = $asID]/title"/>
                        <xsl:text> </xsl:text>
                    </a>
                </p>
            </xsl:for-each> </p>
    </xsl:template>
    <xsl:template name="doOneLine">
        <xsl:param name="indent"/>
        <p style="margin-left: {$indent}px;margin-top:0px;margin-bottom:0px;">
            <xsl:value-of select="title"/>
        </p>
        <xsl:for-each select="siteRefId">
            <xsl:variable name="currItemId" select="."/>
            <p style="margin-left: {number($indent)+10}px;margin-top:0px;margin-bottom:0px;">
                <a href="{$currItemId}_hierarchy.html">
                    <xsl:value-of select="//travelSight[@id = $currItemId]/title"/>
                </a>
            </p>
        </xsl:for-each>
        <xsl:for-each select="location">
            <xsl:call-template name="doOneLine">
                <xsl:with-param name="indent" select="number($indent) + 5"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>


</xsl:stylesheet>
