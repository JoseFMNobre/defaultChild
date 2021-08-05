{include file="frontend/components/indexJournal.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}


{if $numAnnouncementsHomepage && $announcements|@count}
		<section class="cmp_announcements highlight_first">
			<a id="homepageAnnouncements"></a>
			<h2>
				{translate key="announcement.announcements"}
			</h2>
			{foreach name=announcements from=$announcements item=announcement}
				{if $smarty.foreach.announcements.iteration > $numAnnouncementsHomepage}
					{break}
				{/if}
				{if $smarty.foreach.announcements.iteration == 1}
					{include file="frontend/objects/announcement_summary.tpl" heading="h3"}
					<div class="more">
				{else}
					<article class="obj_announcement_summary">
						<h4>
							<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}">
								{$announcement->getLocalizedTitle()|escape}
							</a>
						</h4>
						<div class="date">
							{$announcement->getDatePosted()|date_format:$dateFormatShort}
						</div>

                        <div class="onlineIssn">
							{$onlineIssn = $context->getData('onlineIssn');}
						</div>
                        <div class="publisherName">
							{$publisherName = $context->getData('publisherInstitution');}
						</div>


					</article>
				{/if}
			{/foreach}
			</div><!-- .more -->
		</section>
	{/if}
