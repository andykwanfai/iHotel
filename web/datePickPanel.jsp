<div class="panel-heading">Find available room</div> 
<div class="panel-body">
    <div class="row">
            <div class="col-md-4">
                <label for="date">Date</label>
                <!--input type="date" class="form-control" name="date" placeholder="DD/MM/YY" aria-describedby="sizing-addon1"-->
                <div class="input-daterange input-group" id="datepicker">
                    <input type="text" class="input-sm form-control" name="start" />
                    <span class="input-group-addon">to</span>
                    <input type="text" class="input-sm form-control" name="end" />
                </div>
            </div>
            <div class="col-md-2">
                <label for="day">Nights</label>
                <input type="text" class="form-control" name="day" aria-describedby="sizing-addon1">
            </div>
            <div class="col-md-4">
                <label for="room_opt">Room Option</label>
                <br>
                <div name="room_opt" class="btn-group">
                    <button class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Room type<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                    </ul>
                </div>
            </div>
    </div>
    <br>
    <div class="row">
        <div class="col-md-4">
            <button id="old_find_room_btn" type="submit" value="FindDateAvailableRoom" class="btn btn-success">FIND</button>
        </div>
    </div>
</div>