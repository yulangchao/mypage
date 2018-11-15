<!-- File: /app/View/Blogs/view.ctp -->

        <!-- Start Blog area -->
        <div class="latest-blog-area pd-70">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="latest-blog-single blog-single-full-view">
                                    <div class="blog-image">
                                        <a href="#"><img style="height:446px;" src="<?php echo $blog['BrwImage']['main'] ? $blog['BrwImage']['main']['url'] : '/img/blog-details/1.jpg'; ?>" alt="Pic missing" />
                                        </a>
                                        <div class="blog-date">
                                            <p><span class="blog-day"><?= date('d', strtotime($blog['Blog']['created'])); ?></span> <?= date('M', strtotime($blog['Blog']['created'])); ?></p>
                                        </div>
                                    </div>
                                    <div class="blog-details blog-sig-details">
                                        <div class="details-blog-dt blog-sig-details-dt">
                                            <span><a href="#"></a></span>
                                            <span><a href="#"></a></span>
                                            <span class="pull-right"><a href="#"></a></span>
                                        </div>
                                        <h1><a class="blog-ht" href="#"><?= $blog['Blog']['title']; ?></a></h1>
                                        <?= $blog['Blog']['body']; ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Blog area -->