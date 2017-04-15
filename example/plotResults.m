function plotResults(results)

figure(1) ; clf ;
subplot(1,2,1) ;
hold all ;
styles = {'o-', '+--', '+-'} ;
for i = 1:numel(results)
  semilogy([results(i).info.val.objective]', styles{i}) ; 
end
xlabel('Training samples [x 10^3]') ; ylabel('energy') ;
grid on ;
h = legend(results(:).name) ;
set(h,'color','none');
batchSize = results(1).batchSize ;
title(sprintf('objective-(bs%d)', batchSize)) ;
ylim([0 0.1]) ;
subplot(1,2,2) ;
hold all ;
for i = 1:numel(results)
  plot([results(i).info.val.error]',styles{i}) ;
end
h = legend(results(:).name) ;
grid on ;
xlabel('Training samples [x 10^3]'); ylabel('error') ;
set(h,'color','none') ;
title(sprintf('error-(bs%d)', batchSize)) ;
ylim([0 0.05]) ;
drawnow ;

% this is a function for plotting figures in the terminal
% (the function can be found at https://github.com/albanie/zvision)
% but can be commented out if you are using a normal GUI
zv_dispFig ;
