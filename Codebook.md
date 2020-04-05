\#ORIGINAL DATA

Data from:
<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones" class="uri">http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</a>:
“The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six
activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING,
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz. The experiments have been video-recorded to label the data
manually. The obtained dataset has been randomly partitioned into two
sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data. The sensor signals (accelerometer
and gyroscope) were pre-processed by applying noise filters and then
sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128
readings/window). The sensor acceleration signal, which has
gravitational and body motion components, was separated using a
Butterworth low-pass filter into body acceleration and gravity. The
gravitational force is assumed to have only low frequency components,
therefore a filter with 0.3 Hz cutoff frequency was used. From each
window, a vector of features was obtained by calculating variables from
the time and frequency domain.” For more information read visit
<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones" class="uri">http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</a>,
the website where the original data came from.

Data set tidy\_data.txt The dataset tidy\_data.txt is the result of
cleaning and selecting data from data from an experiment described
above. More information about the measurements in the raw dataset can be
found here:
<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones" class="uri">http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</a>
Here follows a description of what tidy\_data.txt looks like. 1.
variable subject = subject number that performed an activity (total of
30 subjects) 2. variable activity = activity performed by the subject.
There are six activites: • WALKING • WALKING\_UPSTAIRS •
WALKING\_DOWNSTAIRS • SITTING • STANDING • LAYING The remaining columns
contain the features from the data, but only the mean values, but have
been renamed for more descriptive names: • The prefix t –&gt; time • The
prefix f –&gt;freq • dashes and parentheses have been removed • BodyBody
–&gt; Body • CamelCasing has been applied to the names
