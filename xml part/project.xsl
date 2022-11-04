<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="text"/>

    <xsl:template match="/">

        {
        "sneakers": [
        <xsl:for-each select="sneakers/sneaker">
            {
            "sneaker": {
            "@id": "<xsl:value-of select="@id"/>",
            "name": {
            "@sku": "<xsl:value-of select="name/@sku"/>",
            "model": "<xsl:value-of select="name/model"/>",
            "edition": {
            "@height": "<xsl:value-of select="name/edition/@height"/>",
            "#text": "<xsl:value-of select="name/edition"/>"
            }
            },
            "brands": {
            "@type": "<xsl:value-of select="brands/@type"/>",
            "brands": [
            <xsl:for-each select="brands/brand">
                "<xsl:value-of select="current()"/>"
                <xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
            ]
            },
            "features": {
            "colors": [
            <xsl:for-each select="features/colors/color">
                "<xsl:value-of select="current()"/>"
                <xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
            ]
            ,
            "materials": [
            <xsl:for-each select="features/materials/material">
            {
               "<xsl:value-of select="@part"/>":"<xsl:value-of select="current()"/>"
            }<xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
            ],
            "Date": {
            "day": "<xsl:value-of select="features/Date/day"/>",
            "month": "<xsl:value-of select="features/Date/month"/>",
            "year": "<xsl:value-of select="features/Date/year"/>"
            },
            <xsl:choose>
                <xsl:when test="features/limitedEdition='true'">
                    "limitedEdition": "si",
                </xsl:when>
                <xsl:otherwise>
                    "limitedEdition": "no",
                </xsl:otherwise>
            </xsl:choose>
            "colaboration": {
            "artist": {
            "musician": "<xsl:value-of select="features/colaboration/artist/musician"/>",
            "designer": "<xsl:value-of select="features/colaboration/artist/designer"/>"
            },
            "athlete": {
            "@sport": "<xsl:value-of select="features/colaboration/athlete/@sport"/>",
            "#text": "<xsl:value-of select="features/colaboration/athlete"/>"
            },
            "brand": "<xsl:value-of select="features/colaboration/brand"/>"
            },
            <xsl:choose>
                <xsl:when test="features/deadstock='true'">
                    "deadstock": "si",
                </xsl:when>
                <xsl:otherwise>
                    "deadstock": "no",
                </xsl:otherwise>
            </xsl:choose>
            "supply": "<xsl:value-of select="features/supply"/>",
            "madein": {
            "@country": "<xsl:value-of select="features/madein/@country"/>"
            },
            "PriceRetail": {
            "@currency": "<xsl:value-of select="features/PriceRetail/@currency"/>",
            "#text": "<xsl:value-of select="features/PriceRetail"/>"
            }
            },
            "prices": [
            <xsl:for-each select="prices/price">
            {
                <xsl:sort select="@size" order="ascending"/>
            "@size": "<xsl:value-of select="@size"/>",
            "@currency": "<xsl:value-of select="@currency"/>",
            "#text": "<xsl:value-of select="current()"/>"
            }<xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
            ],
            "img": {
            "@src": "<xsl:value-of select="img/@src"/>"
            }
            }
            }<xsl:if test="position() != last()">,</xsl:if>
        </xsl:for-each>
        ]
        }


    </xsl:template>

</xsl:stylesheet>