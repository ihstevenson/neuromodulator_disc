T = readtable('neuromodulator_disc.csv');

size_fun = @(s) (s)/1000;

figure(1)
pubs = T.GoogleScholarFor__Neurons_;
x=T.Discovery_approx_;
y=[1:42];

[~,idx] = sort(pubs,'descend');
col = T.isNeurotransmitter+1;
cmap = lines(8);
cmap = cmap([1 7],:);

scatter(x(idx),y(idx),size_fun(pubs(idx)),cmap(col(idx),:),'filled','MarkerFaceAlpha',.5)
text(x+sqrt(size_fun(s)/pi)/6,y,T.NeuroactiveSubstance)
set(gca,'YTick',[])
set(gca,'TickDir','out')

hold on

% legend
scatter(1996,5,size_fun(1000000),cmap(1,:),'filled','MarkerFaceAlpha',0.5)
scatter(1996,7.5,size_fun(1000000),cmap(2,:),'filled','MarkerFaceAlpha',0.5)

scatter(2000,5,size_fun(500000),cmap(1,:),'filled','MarkerFaceAlpha',0.5)
scatter(2000,7.5,size_fun(500000),cmap(2,:),'filled','MarkerFaceAlpha',0.5)

scatter(2002,5,size_fun(100000),cmap(1,:),'filled','MarkerFaceAlpha',0.5)
scatter(2002,7.5,size_fun(100000),cmap(2,:),'filled','MarkerFaceAlpha',0.5)

text(1992.5,7.5,'Neurotransmitter','HorizontalAlignment','right')
text(1992.5,5,'Neuromodulator','HorizontalAlignment','right')
text(1996,9.5,'1m papers mentioning...','Rotation',60)
text(1999,9,'500k','Rotation',60)
text(2002,8.5,'100k','Rotation',60)

hold off
xlabel('Year Discovered')

set(gcf,'Position',[100 100 800 700])
print('neuromodulator_disc.pdf','-dpdf','-painters')
