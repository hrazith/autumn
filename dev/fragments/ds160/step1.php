
<div class="inputbox shadow qStep hide" id="step1">
	<form>
		<div class="grid">
			<div class="col-1-2">
				<h2>Gender</h2>
				<ul class="input-list gender">
					<li>
						<input type="radio" name="gender" value="male" 
						<?php echo($cust['Sex']=='male')?'checked':'' ?>> Male
					</li>
					<li>
						<input type="radio" name="gender" value="female" 
						<?php echo($cust['Sex']=='female')?'checked':'' ?>> Female
					</li>
				</ul>
			</div>
			<div class="col-1-2">
				<h2>Marital Status</h2>
				<ul class="input-list mstatus">
					<li>
						<input type="radio" name="mstatus" value="married" 
						<?php echo($cust['Marital_Status']=='married')?'checked':'' ?>> Married
					</li>
					<li>
						<input type="radio" name="mstatus" value="single" 
						<?php echo($cust['Marital_Status']=='single')?'checked':'' ?>> Single
					</li>
					<li>
						<input type="radio" name="mstatus" value="divorced" 
						<?php echo($cust['Marital_Status']=='divorced')?'checked':'' ?>> Divorced
					</li>
					<li>
						<input type="radio" name="mstatus" value="widowed"
						<?php echo($cust['Marital_Status']=='widowed')?'checked':'' ?>> Widowed
					</li>
					<li>
						<input type="radio" name="mstatus" value="seperated" 
						<?php echo($cust['Marital_Status']=='seperated')?'checked':'' ?>> Legally seperated
					</li>
				</ul>
			</div>
		</div>
	</form>
</div>

		