<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:d="http://docbook.org/ns/docbook">

    <xsl:import href="urn:docbkx:stylesheet"/>

    <!-- Abstract title should be NetApp blue -->
    <xsl:attribute-set name="abstract.title.properties">
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="color">#0067c5</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="book.titlepage.recto.style">
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="color">#454545</xsl:attribute>
    </xsl:attribute-set>

    <xsl:template name="book.titlepage.verso"/>
    <xsl:template name="book.titlepage.before.verso"/>
    <xsl:template name="book.titlepage.recto">
        <fo:block>
            <fo:table inline-progression-dimension="100%" table-layout="fixed">
                <fo:table-column column-width="1in"/>
                <fo:table-column column-width="4in"/>
                <fo:table-column column-width="1.5in"/>

                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                                <fo:external-graphic width="100%" content-width="scale-to-fit">
                                    <xsl:attribute name="src">images/na_logo_vrt_2c_rgb.png</xsl:attribute>
                                </fo:external-graphic>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block/>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block>
                                <fo:external-graphic width="100%" content-width="scale-to-fit">
                                    <xsl:attribute name="src">images/built_for_openstack.png</xsl:attribute>
                                </fo:external-graphic>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row >
                        <fo:table-cell number-columns-spanned="3">
                            <!-- TODO: add space above this block to space away from logos -->
                            <fo:block text-align="center">
                                <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:title"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row >
                        <fo:table-cell>
                            <fo:block/>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block text-align="left" color="#454545">
                                <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:authorgroup/d:author"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row >
                        <fo:table-cell>
                            <fo:block/>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block text-align="left">
                                <xsl:apply-templates mode="titlepage.mode" select="d:info/d:pubdate"/>
                                <xsl:text> | </xsl:text>
                                <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:releaseinfo"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>

    <xsl:template match="d:title" mode="book.titlepage.recto.auto.mode">
        <fo:inline color="#0067c5" font-size="20">
            <xsl:apply-templates mode="titlepage.mode"/>
        </fo:inline>
    </xsl:template>

    <!-- ToC -->
    <xsl:attribute-set name="toc.line.properties">
        <xsl:attribute name="font-weight">
            <xsl:choose>
                <xsl:when test="self::d:chapter">bold</xsl:when>
                <xsl:otherwise>normal</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="color">
            <xsl:choose>
                <xsl:when test="self::d:chapter">#0067c5</xsl:when>
                <xsl:otherwise>#454545</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <!-- no headers -->
    <xsl:template name="header.content"/>  

    <!-- footers -->
    <xsl:param name="footer.column.widths">1 1 1</xsl:param>
    <xsl:attribute-set name="footer.content.properties">
        <xsl:attribute name="font-size">10pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:template name="footer.content">  
        <xsl:param name="pageclass" select="''"/>
        <xsl:param name="sequence" select="''"/>
        <xsl:param name="position" select="''"/>
        <xsl:param name="gentext-key" select="''"/>

        <fo:block>
            <xsl:choose>
                <xsl:when test="$sequence != 'blank' and $position = 'left'">
                    <fo:page-number/>
                </xsl:when>
                <xsl:when test="$sequence != 'blank' and $position = 'center'">
                    <xsl:value-of select="ancestor-or-self::d:book/d:titleabbrev/text()"/>
                </xsl:when>
            </xsl:choose>
        </fo:block>
    </xsl:template>

    <!-- Table header should have blue background, white font -->
    <xsl:template name="table.row.properties">
        <xsl:if test="ancestor::d:thead">
            <xsl:attribute name="font-weight">bold</xsl:attribute>
            <xsl:attribute name="color">#FFFFFF</xsl:attribute>
            <xsl:attribute name="background-color">#0067c5</xsl:attribute>
        </xsl:if>
    </xsl:template>

    <!-- Text should be NetApp deep gray -->
    <xsl:attribute-set name="root.properties">
        <xsl:attribute name="color">#454545</xsl:attribute>
    </xsl:attribute-set>

    <!-- Chapter titles should be NetApp blue -->
    <xsl:attribute-set name="component.title.properties">
        <xsl:attribute name="color">#0067c5</xsl:attribute>
    </xsl:attribute-set>

    <!-- Hyperlinks should be NetApp blue -->
    <xsl:attribute-set name="xref.properties">
        <xsl:attribute name="color">#0067c5</xsl:attribute>
        <xsl:attribute name="text-decoration">underline</xsl:attribute>
    </xsl:attribute-set> 

    <!-- Customize admonitions -->
    <xsl:attribute-set name="admonition.title.properties">
        <xsl:attribute name="font-style">italic</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="graphical.admonition.properties">
        <xsl:attribute name="border-top">0.5pt solid black</xsl:attribute>
        <xsl:attribute name="border-bottom">0.5pt solid black</xsl:attribute>
        <xsl:attribute name="padding-top">4pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">4pt</xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>
