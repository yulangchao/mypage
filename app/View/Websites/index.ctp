<style>
.content{
    text-overflow: ellipsis;
    overflow: hidden;
    /* width: 80%; */
    height: 76px;
    white-space: normal;
}

</style>




<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <!-- Add your site or application content here -->
    <!--Header Start-->
    <div class="as-mainwrapper">
        <div class="apartment-area pd-70">
            <div class="container">
				<div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="property-heading">
                            <h1>My Web Applications</h1>
                            <p></p>
                        </div>
                    </div>
                </div>
                <div class="row mg-b-30">
					<?php foreach ($websites as $website): ?>
						<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 grid-item" style="margin-top:20px;">
							<div class="property-item dh-container res-mg-bt">
								<img style="width:370px; height:270px;" src="<?php echo $website['BrwImage']['main'] ? $website['BrwImage']['main']['url'] : '/img/property/1.jpg'; ?>" alt="" />
								<div class="property-details dh-overlay">
									<div class="property-over"></div>
									<div class="property-details-inner">
										<h5><?=$website['Website']["title"]?></h5>
										<p class="content"><?=$website['Website']["content"]?></p>
										<a class="links" id="<?=$website['Website']["id"]?>" href="<?=$website['Website']["link"]?>"><i class="fa fa-chain"></i></a>
										<a data-lightbox="roadtrip-<?=$website['Website']["content"]?>" href="<?php echo $website['BrwImage']['main'] ? $website['BrwImage']['main']['url'] : '/img/property/1.jpg'; ?>"><i class="fa fa-plus"></i></a>
									</div>
								</div>
							</div>
						</div>
					<?php endforeach;?>
					<?php unset($website);?>
                </div>
				<div class="row mg-t-30">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <br>
                                <div class="row" style="text-align: center">
                                    <div class="pagination pagination-large text-center">
                                        <ul class="pagination">
                                            <?php
echo $this->Paginator->prev(__('« Previous'), array('tag' => 'li'), null, array('tag' => 'li', 'class' => 'disabled', 'disabledTag' => 'a'));
echo $this->Paginator->numbers(array('separator' => '', 'currentTag' => 'a', 'currentClass' => 'active', 'tag' => 'li', 'first' => 1));
echo $this->Paginator->next(__('Next »'), array('tag' => 'li', 'currentClass' => 'disabled'), null, array('tag' => 'li', 'class' => 'disabled', 'disabledTag' => 'a'));
?>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row" style="text-align: center">
                                    <?php echo $this->Paginator->counter(); ?>
                                </div>
                                <br>
								</div>
							</div>
            </div>
        </div>

    </div>

</body>















<script>

$('document').ready(function(){

    $('.links').click(function(){
        console.log('kkk');
        $.ajax({
            url: "/websites/click/"+$(this).attr('id'),
            type: "POST",
            success: function (data) {
                console.log('done');
            }
        })
    });


})


</script>
