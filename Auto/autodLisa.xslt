<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<div style="overflow-y: scroll; height: 200px;">
			<table>
				<tr>
					<th>Registrinumber</th>
					<th>Mark</th>
					<th>Väljastmise aasta</th>
					<th>Omanik</th>
				</tr>
				<xsl:for-each select="autod/auto">
					<tr>
						<td>
							<xsl:value-of select="registrinumber"/>
						</td>
						<td>
							<xsl:value-of select="mark"/>
						</td>
						<td>
							<xsl:value-of select="vaasta"/>
						</td>
						<td>
							<xsl:value-of select="omanik"/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</div>
		<br />
		<hr />
		<h3>Auto regnumbrid mis algavad 2:</h3>
		<div style="overflow-y: scroll; height: 200px;">
			<table>
				<tr>
					<th>Registrinumber</th>
					<th>Mark ja väljastmise aasta</th>
					<th>Omanik</th>
				</tr>
				<xsl:for-each select="autod/auto[starts-with(registrinumber, '2')]">
					<xsl:sort select="vaasta" order="descending"/>
					<tr>
						<td>
							<xsl:value-of select="registrinumber"/>
						</td>
						<td>
							<xsl:value-of select="concat(mark, ', ', vaasta)"/>
						</td>
						<td>
							<xsl:value-of select="omanik"/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</div>
		<br />
		<h3>Autode üldkogus xml jadas</h3>
		<p>count() funktsioon</p>
		<xsl:value-of select="count(autod/auto)"/>
		<br />
		<h3>Autode üldkogus, mis on vaasta=2006 xml jadas</h3>
		<p>count() ja [vaasta=2006] funktsioonids</p>
		<xsl:value-of select="count(autod/auto[vaasta=2006])"/>
		<br />
		<h3>Trüki välja (eralda komaga) auto registrinumbri numbrite</h3>
		<xsl:for-each select="autod/auto">
				<xsl:value-of select="substring(registrinumber, 0, 4 )"/> - <xsl:value-of select="registrinumber"/>,
		</xsl:for-each>
		<h3>Trüki välja (eralda komaga) omaniku nime viimane täht</h3>
		<xsl:for-each select="autod/auto">
				<xsl:value-of select="substring(omanik, string-length(omanik), 1)"/> - <xsl:value-of select="omanik"/>,
		</xsl:for-each>
		<h3>Auto omanikud, mis sisaldavad A täht</h3>
		<xsl:for-each select="autod/auto">
			<xsl:if test="contains(omanik, 'a')">
				<xsl:value-of select="omanik"/>,
			</xsl:if>
		</xsl:for-each>
		<h3>Leia, mitme auto registrimärgi numbritest viimane on 2</h3>
		<xsl:value-of select="count(autod/auto[substring(substring(registrinumber, 0, 4 ), string-length(substring(registrinumber, 0, 4 )), 1) = '2'])"/>
		<h3>Teata iga registrinumbri puhul, millises kuus auto ülevaatusele pe... </h3>
		<div style="overflow-y: scroll; height: 200px;">
			<table>
				<tr>
					<th>Registrinumber</th>
					<th>Mark</th>
					<th>Väljastmise aasta</th>
					<th>Omanik</th>
					<th>Ülevaatuse kuu</th>
				</tr>
				<xsl:for-each select="autod/auto">
					<tr>
						<td>
							<xsl:value-of select="registrinumber"/>
						</td>
						<td>
							<xsl:value-of select="mark"/>
						</td>
						<td>
							<xsl:value-of select="vaasta"/>
						</td>
						<xsl:choose>
							<xsl:when test="contains(omanik, 'a')">
								<td bgcolor="yellow">
									<xsl:value-of select="omanik"/>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td bgcolor="gray">
									<xsl:value-of select="omanik"/>
								</td>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="(substring(registrinumber, 3, 1)+2)>=9">
								<td bgcolor="green">
									<xsl:value-of select="substring(registrinumber, 3, 1)+2"/>
								</td>
							</xsl:when>
							<xsl:otherwise>
								<td bgcolor="red">
									<xsl:value-of select="substring(registrinumber, 3, 1)+2"/>
								</td>
							</xsl:otherwise>
						</xsl:choose>
					</tr>
				</xsl:for-each>
			</table>
		</div>
		<h3>Leia registrinumbri keskmine arv (AVERAGE) ning näita tulemused tabelina + veerg kesk arvuga</h3>
		<div style="overflow-y: scroll; height: 200px;">
			<table>
				<tr>
					<th>Registrinumber</th>
					<th>Mark</th>
					<th>Väljastmise aasta</th>
					<th>Omanik</th>
					<th>Registrinumbri keskmine arv</th>
				</tr>
				<xsl:for-each select="autod/auto">
					<tr>
						<td>
							<xsl:value-of select="registrinumber"/>
						</td>
						<td>
							<xsl:value-of select="mark"/>
						</td>
						<td>
							<xsl:value-of select="vaasta"/>
						</td>
						<td>
							<xsl:value-of select="omanik"/>
						</td>
						<td>
							<xsl:value-of select="round((substring(registrinumber, 1, 1)+substring(registrinumber, 2, 1)+substring(registrinumber, 3, 1)) div 3)"/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</div>
		<h3>Näita kõik autod margiga (Ford), millel väljastamise aasta on pärast 2000 aa.</h3>
		<table>
		<tr>
			<th>Registrinumber</th>
			<th>Mark</th>
			<th>Väljastmise aasta</th>
			<th>Omanik</th>
		</tr>
		<xsl:for-each select="autod/auto[mark='Ford' and vaasta>2000]">
			<tr>
				<td>
					<xsl:value-of select="registrinumber"/>
				</td>
				<td>
					<xsl:value-of select="mark"/>
				</td>
				<td>
					<xsl:value-of select="vaasta"/>
				</td>
				<td>
					<xsl:value-of select="omanik"/>
				</td>
			</tr>
		</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
