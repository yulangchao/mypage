
<body>
    <div class="as-mainwrapper">

        <!-- Start Blog area -->
        <div class="blog-page-area pd-70">
            <div class="container">
				<div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="blog-main-heading">
                            <h1>My Blog</h1>
                            <p></p>
                        </div>
                    </div>
                </div>
                <div class="row mg-b-30">
                    <?php foreach ($blogs as $blog): ?>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 bl-res-mg-bt" style="margin-top: 20px;">
                                <div class="single-blog-item">
                                    <div class="single-blog-image">
                                        <a href="/blogs/view/<?=$blog['Blog']["id"]?>">
                                            <img style="width: 370px;height: 250px;" src="<?php echo $blog['BrwImage']['main'] ? $blog['BrwImage']['main']['url'] : '/img/blog/1.jpg'; ?>" alt="No Image">
                                            <div class="date-blog">
                                            <p class="date-number"><?= date('d', strtotime($blog['Blog']['created'])); ?></p>
                                            <p class="date-month"><?= date('M', strtotime($blog['Blog']['created'])); ?></p>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="single-blog-text">
                                        <h3><a class="blog-hd" href="/blogs/view/<?=$blog['Blog']["id"]?>"><?= $blog['Blog']['title']; ?></a></h3>
                                        <div class="single-item-comment-view">
                                            <span><i class="fa fa-clock-o"></i> <?= date('Y/m/d H:i:s', strtotime($blog['Blog']['created'])); ?></span>
                                        </div>
<p></p>                                        <a class="readmore" href="/blogs/view/<?=$blog['Blog']["id"]?>">Read More</a>
                                    </div>
                                </div>
                            </div>
                    <?php endforeach;?>
                    <?php unset($blog);?>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                    <br>
                    <div class="row" style="text-align: center">
                        <div class="pagination pagination-large text-center">
                            <ul class="pagination">
                                <?php
                                echo $this->Paginator->prev(__('« Previous'), array('tag' => 'li'), null, array('tag' => 'li','class' => 'disabled','disabledTag' => 'a'));
                                echo $this->Paginator->numbers(array('separator' => '','currentTag' => 'a', 'currentClass' => 'active','tag' => 'li','first' => 1));
                                echo $this->Paginator->next(__('Next »'), array('tag' => 'li','currentClass' => 'disabled'), null, array('tag' => 'li','class' => 'disabled','disabledTag' => 'a'));
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
</body>
