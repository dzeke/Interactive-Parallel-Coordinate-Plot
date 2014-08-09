%% FigGenForNearOptPaper.m
% Matlab 2013b Script to generate Figures in the paper
% 
% David E. Rosenberg (in review) "Near-optimal alternative generation,
% visualization, and interaction for water resources decision making".
% Water Resources Research. Submitted August 2014
%
% The script automatically generates Figures 1, 2, 3, and 5.
% The script provides  in comments instructions to interactively produce
%   - Figure 4 from Figure 3
%   - Figure 6 from Figure 5
%   - Figure 7 from Figure 3
%
% #####################
%   Programmed by David E. Rosenberg
%   August 2014
%   
%   Dept. of Civil & Env. Engineering and Utah Water Research Lab
%   Utah State University
%   david.rosenberg@usu.edu
%
%   Citation:
%   David E. Rosenberg (in review) "Near-optimal alternative generation,
%   visualization, and interaction for water resources decision making".
%   Water Resources Research. Submitted August 2014

%   Licensing:
%   This code is distributed AS-IS with no expressed or implied warranty regarding the claimed functionality. The entire code or parts 
%   may be used for any non-commercial purpose so long as the use is cited per the citation above. Use for any commercial purpose requires 
%   prior written permission from the author.
%
%   Bug Reports:
%   Bug reports are much appreciated. Please submit via the the issue tracker on the
%   GitHub repository where you downloaded this file.
%   Note, while much appreciated, there is no promise of when, if the bug will be corrected.

%% Generating the Figures

% #### Figure 1 ####
% Optimal solution (blue circle), single maximally-different alternative produced 
% by the Modelling to Generate Alternatives method (purple triangle), and full 
% near-optimal region (green shading) for an example two-decision problem with a 
% quadratic objective function, four linear constraints, and tolerable deviation of ?=1.80.
%
% After the figure loads, use the crosshairs to mouse-over and label the
% objective function contours. Click enter to finish.
%
Fig1_FeasibleNearOptCompare([1 -20 5 0 100], [3 2;0 1], ['<' '<'], [12 4]','min',1.8,14, {'Decision Variable 1 (X_1)' 'Decision Variable 2' '(X_2)'},20,0,1);
set(gcf,'NumberTitle','off','Name','Near-Optimal Figure 1. Near-optimal region for example problem');

%%
% #### Figure 2 ####
% Point (pink), linear (blue), and other topological relations in Cartesian (left) and 
% Parallel (right) coordinate systems.
%
Fig2_CartParCompare(14,1,{'Decision 1' 'Decision 2' sprintf('%s\n%s','Objective','Function')});
set(gcf,'NumberTitle','off','Name','Near-Optimal Figure 2. Compare Cartesian and Parallel Coordinate plots');

%%
% #### Figure 3 ####
% Phosphorus removal strategies for Echo Reservoir, Utah recommended by
% (i) the optimal solution (thick black line), (ii) five maximally-different Modelling to Generate
% Alternatives (purple lines) and (iii) 2,500 stratified sampled near-optimal alternatives generated 
% by the new tools (green lines). The stratified alternatives show managers can flexibly target any 
% practice to any source in any sub-watershed and still keep removal costs within 10% of the cost of the optimal solution
%
[mResult nO vParams] = LoadEchoGamsResults('WQNE_outG6.gdx',3,2500,0);
set(gcf,'NumberTitle','off','Name','Near-Optimal Figure 3. Compore optimal solution, MGA, and near-optimal region for Echo Reservoir problem');

%%
% #### Figure 4 ####
% Exploring the effects of interactively setting sliders to not stabilize stream banks in Chalk Creek 
% (first checked axis) but shift and increase phosphorus removal in the Weber above and below Wanship 
% sub-watersheds (second and third checked axes). Sliders show the range of allowable phosphorus removal 
% for each practice given slider settings while purple lines show the family of alternatives generated by 
% the slider settings.
%

% Interactive Steps To Shift, Increase stream bank stabilization
%   1. Generate Figure 3. At the commnad prompt paste:
%           >> [mResult nO vParams] = NearOptimalLP2('WQNE_outG6.gdx',3,2500,0);
%   2. Once the figure finally loads, click the Interact tab
%   3. From the Controls Menu=>Sliders=>uncheck Hide sliders (show them).
%       Sliders will appear on the plot all set to minimum allowable values
%   4. Check the box for Stabilize stream banks in Chalk Creak (set level to zero).
%   5. Set the slider to Stabilize Stream banks in the Weber below Wanship
%       sub-watershed to 3150 kg. Or in the Filter Exisiting Alternatives box,
%       enter 3150 in the Set value text box for the axes. Ranges for other sliders
%       will update.
%   6. Set the slider for Stabilize stream banks in the Weber above Wanship
%       sub-watershed to 3,700 kg. Again, other sliders will update.
%   7. In the Generate New Alternatives box, click the Generate button. The
%       command window will update with info on the alternative generation. A new group of
%       lines will add to the plot (in purple).
%   8. Format the plot to compare to previous settings.
%        - Click the Display tab
%        - Enter a new name for the new second group in purple (e.g, 'Stream
%        bank stabilization' 
%        - Change the Ord (Order) for the group from 2 to 3.
%        - Similarly, change the order for the MGA group to 2 and uncheck
%        the box at the right (do not show the MGA group)
%        - Click the Reorder Groups button
%   9. Retitle the figure. Paste at the command promt:
%        set(gcf,'NumberTitle','off','Name','Near-Optimal Figure 4. Shifted, increased stream bank stabilization');
%        
%   

%%
% #### Figure 5 ####
% Comparing pareto solutions (orange lines and triangles), maximally-different Modelling to Generate Alternatives 
% (purple lines and circles), and stratified sampled near-optimal alternatives (green lines and crosses) for an 
% updated multi-objective formulation in linked objective-decision spaces (main parallel coordinate plot) and 
% objective space (inset Cartesian plot).
%
[mResult nO vParams] = LoadEchoGamsResults('WQNE_outG6.gdx',3,2500,1); %same as Figure 3 but last parameter changed to 1
set(gcf,'NumberTitle','off','Name','Near-Optimal Figure 5. Comparisons for multi-objective problem');

%%
% #### Figure 6 ####
% Sub-region of near-optimal alternatives that remove large amounts of phosphorus (purple lines and markers) but 
% use more varied locations and practices  than pareto solutions (orange lines and triangles).   
%
    %[mResult nO vParams] = NearOptimalLP2('WQNE_outG6.gdx',3,2500,1); %Generate Figure 5
 
% Interactive Steps to generate alternatives that remove a lot of phosphorus
%   1. Generate Figure 5. At the commnad prompt paste:
%          >> [mResult nO vParams] = NearOptimalLP2('WQNE_outG6.gdx',3,2500,1);
%   2. Once the figure finally loads, click the Interact tab
%   3. Just above the Generate New Alternatives box, enter 0.65 for the
%       Subspace Error (this setting will select alternatives that have
%       values of the (Set value +/- Error). Here error is measured as a
%       fraction of the tick spacing
%   4. From the Controls Menu=>Sliders=>uncheck Hide sliders (show them).
%       Sliders will appear on the plot all set to minimum allowable values
%   5. Set the slider Phos. Removed axis to it's upper extent.
%       Or in the Filter Exisiting Alternatives box,
%       enter 14450 kg in text box for the axes. Other the ranges for other sliders
%       will update.
%   6. In the Generate New Alternatives box, click the Generate button. The
%       command window will update with info on the alternative generation. A new group of
%       lines will add to the plot (in purple).
%   7. Format the plot to compare to previous settings.
%        - Click the Display tab
%        - Enter a new name for the new second group in purple (e.g, 'Large phos. removal' 
%        - Change the Ord (Order) for this group from 2 to 3.
%        - Similarly, change the order for the MGA group to 2 and uncheck
%           the box at the right (do not show the MGA group)
%        - Click the Reorder Groups button
%        - Hide the sliders (Controls menu=>Sliders=>check Hide sliders
%    8. Retitle the figure. At the command prompt, enter:
%           >> set(gcf,'NumberTitle','off','Name','Near-Optimal Figure 6. Alternatives that remove lots of phosphorus');
%   

%%
% #### Figure 7 ####
% Progressive effects of relaxing the near-optimal tolerance parameter on ranges of allowable phosphorus
% removal for each practice. Green shading redundantly denotes removal cost and varies in 5% increments
% from dark green (optimal cost) to light green (125% of optimal cost).
%    
% Interactive Steps To Generate alternatives in an expanded near-optimal region
%   1. Generate Figure 3. At the commnad prompt paste:
%          >> [mResult nO vParams] = NearOptimalLP2('WQNE_outG6.gdx',3,2500,0);
%   2. Once the figure finally loads, click the Interact tab
%   3. Set the Near Optimal Tolerance to 1.25
%   4. In the Generate New Alternatives box, click the Generate button. The
%       command window will update with info on the alternative generation. A new group of
%       lines will add to the plot (in purple).
%   5. Format the plot to compare to previous settings.
%        - Click the Display tab
%        - Enter a new name for the new second group in purple (e.g, 'Tolerance 1.25' 
%        - Change the Ord (Order) for the 2nd purple group from 2 to 1.
%        - Similarly, change the order for the first green group from 1 to
%        2ide it)
%        - Uncheck the MGA group (to h
%        - Click the Reorder Groups button and the Tolerance 1.25 group
%        will plot behind the Random Interior group and it possible to see
%        the effects of expanding from 1.10 (Random Interior) to 1.25.
%   6. To show the color ramp of effects of all changes from 1.0 to 1.25:
%        - Click the Color Ramp tab
%        - Enter the # Color classes as 5
%        - Set Direction to Descend
%        - Check the box associated with the Removal Cost axis (far left
%        axis)
%        - On the Color Ramp tab, check the box labeled Ramp color. The
%           color ramp will appear. Additionally, a checkbox for each color band
%           will appear on the Color Ramp tab. Uncheck to hide the traces
%           in the specified band.
%    7. Re-title the figure. Run the command at the command promp:
%         >>  set(gcf,'NumberTitle','off','Name','Near-Optimal Figure 7. Expanded near-optimal region');      

msgbox('Finished auto-generating Figures 1, 2, 3, and 5. To finish generating Figures 4, 6, and 7, see further interactive steps for each figure listed as comments in the script.','Title','Progress Report')