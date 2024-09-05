<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
		<table style="width: 100%;">
			<th style="border: 1px solid #ddd; padding: 8px;">Vana vanem</th>
			<th style="border: 1px solid #ddd; padding: 8px;">Vanem</th>
			<th style="border: 1px solid #ddd; padding: 8px;">Laps</th>
			<th style="border: 1px solid #ddd; padding: 8px;">Lapsi laps</th>
			<xsl:for-each select="sugupuu/numbers/number">
				<tr>
					<xsl:for-each select="/sugupuu/inimene">
						<td style="border: 1px solid #ddd; padding: 8px">
							<xsl:value-of select="concat(/sugupuu/inimene/nimi, ', ', /sugupuu/inimene/synniaasta, ', ', /sugupuu/inimene/synnikoht)"/>
						</td>
						<xsl:if test="/sugupuu/inimene/lapsed/inimene/nimi!=''">
							<td style="border: 1px solid #ddd; padding: 8px">
								<xsl:value-of select="concat(/sugupuu/inimene/lapsed/inimene/nimi, ', ', /sugupuu/inimene/lapsed/inimene/synniaasta, ', ', /sugupuu/inimene/lapsed/inimene/synnikoht)"/>
							</td>
							<xsl:if test="/sugupuu/inimene/lapsed/inimene/lapsed/inimene[.]/nimi!=''">
								<td style="border: 1px solid #ddd; padding: 8px">
									<xsl:value-of select="concat(/sugupuu/inimene/lapsed/inimene/lapsed/inimene[.]/nimi, ', ', /sugupuu/inimene/lapsed/inimene/lapsed/inimene[.]/synniaasta, ', ', /sugupuu/inimene/lapsed/inimene/lapsed/inimene[.]/synnikoht)"/>
								</td>
								<xsl:if test="/sugupuu/inimene/lapsed/inimene/lapsed/inimene/lapsed/inimene/nimi!=''">
									<td style="border: 1px solid #ddd; padding: 8px">
										<xsl:value-of select="concat(/sugupuu/inimene/lapsed/inimene/lapsed/inimene/lapsed/inimene[.]/nimi, ', ', /sugupuu/inimene/lapsed/inimene/lapsed/inimene/lapsed/inimene/synniaasta, ', ', /sugupuu/inimene/lapsed/inimene/lapsed/inimene/lapsed/inimene/synnikoht)"/>
									</td>
								</xsl:if>
							</xsl:if>
						</xsl:if>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>
    </xsl:template>
</xsl:stylesheet>
