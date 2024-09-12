<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<style>
					table {border-collapse: collapse; width: 100%;}
					th, td {border: 1px solid black; padding: 8px;}
					th {background-color: #f2f2f2;}
				</style>
			</head>
			<body>
				<h1 style="background-color: green; color: white;">1-5 ülesanned</h1>
				<div style="overflow-y: scroll; height: 500px;">
					<hr />
					<!--5 ülesanne - kuva iga reisi kogumaksumuse (mul on juba koguhind tabelis ja selle pärast ma tegin erinevalt) -->
					<h1>Reisidele läinud inimeste koguarv: <xsl:value-of select="sum(reisid/reis/reisigrupi_suurus)"/> </h1>
					<h1>Kõikide reiside kogumaksumus: <xsl:value-of select="round(sum(reisid/reis/koguhind))"/> </h1>
					<hr />
					<xsl:for-each select="reisid/reis">
						<h1>
							<xsl:value-of select="@reisinimi"/> 
						</h1>
						<h2>
							<xsl:value-of select="lahtekoht"/> -> <xsl:value-of select="sihtkoht"/> <!--1 ülesanne - kuvada iga reisi sihtkoht pealkirjana-->
						</h2>
						<xsl:choose>
							<xsl:when test="koguhind>=5000"> <!--4 ülesanne - Lisa oma tingimus-->
								<h3 style="background-color: #C40C0C; color: #FFC100;">
									Premium reis
								</h3>
							</xsl:when>
							<xsl:otherwise>
								<h3 style="background-color: #F8EDE3; color: #8D493A">
									Tavaline reis
								</h3>
							</xsl:otherwise>
						</xsl:choose>
						<ul> <!--2 ülesanne - kkomponendid peavad olema kuvatud täpploeteluna-->
							<li>
								Koguhind: <xsl:value-of select="koguhind"/>
							</li>
							<li>
								Reisigrupi suurus: <xsl:value-of select="reisigrupi_suurus"/>
							</li>
							<ul style="background-color: yellow;"> <!--3 ülesanne - Kolmanda taseme struktuuri andmed tuleb kuvada kollasel taustal-->
								<li>
									Alguskuupäev: <xsl:value-of select="reisikuupaev/alguskuupaev"/>
								</li>
								<li>
									Lõppkuupaev: <xsl:value-of select="reisikuupaev/loppkuupaev"/>
								</li>
							</ul>
						</ul>
						<hr />
					</xsl:for-each>
				</div>
				<br/>
				<br/>
				<hr />
				<br/>
				<br/>
				<h1 style="background-color: green; color: white;">6-8 ülesanned</h1>
				<div style="overflow-y: scroll; height: 400px;">
						<table id="reis">
							<style>
								#reis tr:nth-child(even){background-color: gray;} <!--8 ülesanne - read on üle rea erineva värviga-->
							</style>
						<tr>
							<th>Reisinimi</th>
							<th>Lendu</th>
							<th>Koguhind</th>
							<th>Reisigrupi suurus</th>
							<th>Alguskuupäev</th>
							<th>Lõppkuupaev</th>
						</tr>
						<xsl:for-each select="reisid/reis[reisigrupi_suurus >= 10]"> <!--6 ülesanne - filtreeri ja kuva ainult need reisid, mille reisigrupi suurus suurem kui 10-->
							<xsl:sort select="koguhind" order="ascending"/> <!--7 ülesanne - sorteeri kõik reisid vastavalt hinnangule-->
							<tr>
								<td>
									<xsl:value-of select="@reisinimi"/>
								</td>
								<td>
									<xsl:value-of select="lahtekoht"/> -> <xsl:value-of select="sihtkoht"/>
								</td>
								<td>
									<xsl:value-of select="koguhind"/>
								</td>
								<td>
									<xsl:value-of select="reisigrupi_suurus"/>
								</td>
								<td>
									<xsl:value-of select="reisikuupaev/alguskuupaev"/>
								</td>
								<td>
									<xsl:value-of select="reisikuupaev/loppkuupaev"/>
								</td>
							</tr>
						</xsl:for-each>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>

