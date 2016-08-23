
<div class="inputbox form-intake shadow hide" id="step2">	
	<form>
		<div class="grid">
			<div class="col-3-4">
				<h2>Names</h2>	
				<ul class="input-list names">
					<li>
						<input type="text" placeholder="Surnames Names" name="lname" 
						value="<?php echo isset($cust['Last_Name']) ? $cust['Last_Name'] : '' ?>"/>
					</li>
					<li>
						<input type="text" placeholder="Given Names" name="fname" 
						value="<?php echo isset($cust['First_Name']) ? $cust['First_Name'] : '' ?>"/>
					</li>
					<li>
						<input type="text" placeholder="Full name in native alphabet" name="nname" 
						value="<?php echo isset($cust['Full_Name_In_Native_Alphabet']) ? $cust['Full_Name_In_Native_Alphabet'] : '' ?>"/>
					</li>
					
				</ul>
			</div>
			<div class="col-1-4">
				<h2>Other</h2>	
			</div>
			
		</div>
	</form>
</div>
