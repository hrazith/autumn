
<div class="inputbox shadow qStep hide" id="step2">	
	<form>
		<div class="grid">
			<div class="col-3-4">
				<h2>Names</h2>	

				<ul class="input-list names">
					<li>
						<label for="lname">Surname/Last name</label>
						<input type="text" placeholder="Surnames Names" name="lname" 
						value="<?php echo isset($cust['Last_Name']) ? $cust['Last_Name'] : '' ?>"/>
					</li>
					<li>
						<label for="fname">First name</label>
						<input type="text" placeholder="Given Names" name="fname" 
						value="<?php echo isset($cust['First_Name']) ? $cust['First_Name'] : '' ?>"/>
					</li>
					<li>
						<label for="nname">Full name in native alphabet</label>
						<input type="text" placeholder="Full name in native alphabet" name="nname" value="<?php echo isset($cust['Full_Name_In_Native_Language']) ? $cust['Full_Name_In_Native_Language'] : '' ?>"/>
					</li>
					
				</ul>
			</div>
			<div class="col-1-4">
				<h2>&nbsp;</h2>	
				<h3>Have you used any other names?</h3>
				<ul class="input-list othernames">
					<li>
						<input type="radio" name="onames" value="yes" 
						<?php echo($cust['Other_Name_Used']=='yes')?'checked':'' ?>> Yes
					</li>
					<li>
						<input type="radio" name="onames" value="no" 
						<?php echo($cust['Other_Name_Used']=='no')?'checked':'' ?>> No
					</li>
				</ul>
				
			</div>
		</div>
	</form>
</div>
