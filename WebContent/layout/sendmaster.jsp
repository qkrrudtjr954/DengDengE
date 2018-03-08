<%@ page pageEncoding="UTF-8"%>

<div class="modal" tabindex="-1" role="dialog" id="myModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">문의 사항</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label for="inquiry-title">Title</label> <input type="text"
						class="form-control" id="inquiry-title" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="user-email">Email</label> <input type="text"
						class="form-control" id="inquiry-email" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="inquiry-content">Content</label>
					<textarea class="form-control" id="inquiry-content" rows="3"
						readonly="readonly"></textarea>
				</div>
				<div class="form-group">
					<label for="inquiry-content">Response</label>
					<textarea class="form-control" id="inquiry-response" rows="3"
						readonly="readonly"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


<!-- Icons -->
<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
	
<script type="text/javascript">
	function sendMasterTableSet() {
		$.ajax({
			url : 'MainControl',
			data : { command : 'getSendMaster' },
			method : 'POST',
			success : function (data) {
				var inquiries = JSON.parse(data);
				for(var i=0; i<inquiries.length; i++){
					var html = 
						'<tr>'+
							'<td>'+(i+1)+'</td>'+
							'<td>'+
								'<a href="#" onclick="showInquiry('+inquiries[i].seq+')">'+inquiries[i].title+'</a>'+
							'</td>'+
							'<td>'+
								printStatus(inquiries[i].complete)+
							'</td>'+
						'</tr>';
						
					$('#sendMasterTable tbody').append(html);
				}
				feather.replace();
			}
		})
	}
	
	function printStatus(complete) {
		if(complete == 0){
			return '<span data-feather="thumbs-down" style="color:red;"></span>';
		} else {
			return '<span data-feather="thumbs-up" style="color:green"></span>';	
		}
	}
	
	function showInquiry(seq){
		$.ajax({
			url : 'MainControl',
			data : { command : 'getInquiry', seq : seq},
			method : 'POST', 
			success : function (data) {
				var inquiry = JSON.parse(data);
				
				$('#inquiry-title').val(inquiry.title);
				$('#inquiry-content').val(inquiry.content);
				$('#inquiry-email').val(inquiry.email);
				
				if(inquiry.answer == null){
					$('#inquiry-response').val('ëµë³ ì§í ì¤');
				} else {
					$('#inquiry-response').val(inquiry.answer);						
				}
				
				$('#myModal').modal();
			}
		})
	}
</script>