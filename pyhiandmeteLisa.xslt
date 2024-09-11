<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>Sugupuu</title>
				<style>
					table {border-collapse: collapse; width: 100%;}
					th, td {border: 1px solid black; padding: 8px;}
					th {background-color: #f2f2f2;}
				</style>
			</head>
			<body>
				<h2>Sugupuu</h2>
				<table>
					<tr>
						<th>Vana vanem</th>
						<th>Vanem</th>
						<th>Laps</th>
						<th>Lapse laps</th>
					</tr>
					<xsl:for-each select="sugupuu/inimene">
						<xsl:for-each select="lapsed/inimene">
							<xsl:for-each select="lapsed/inimene">
								<xsl:for-each select="lapsed/inimene">
									<tr>
										<td>
											<xsl:value-of select="../../../../../../nimi"/>
										</td>
										<td>
											<xsl:value-of select="../../../../nimi"/>
										</td>
										<td>
											<xsl:value-of select="../../nimi"/>
										</td>
										<td>
											<xsl:value-of select="nimi"/>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
