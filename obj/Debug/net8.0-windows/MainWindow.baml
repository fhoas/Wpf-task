   M S B A M L   `   `   `  ����B  >WpfApp1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:WpfApp1.ConvertersWpfApp1.Converters  5   	       WpfApp1.MainWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   2local clr-namespace:WpfApp1.Converters     5   	     � Title$  Coordinate Input��5   	   $	��600��6"   $	��400��6/   .��5      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5	      $��* �6   .+�5   
   �� $��0��6   .+�5      � $��10q�6   .+�5      �� -   5        $��XTextBox��5   R   ��6   �� *X+ �� UpdateSourceTrigger$ PropertyChanged=�6R   �� 5      $��Enter X Coordinate��6   
������� J� IsHitTestVisible$ False��6H   $��Center=�5      $
��Left=�67   $��5,0,0,0q�6R   y�5      �� *Text+ �� ElementName$ XTextBox�� $   EmptyStringToVisibilityConverter �� 	Converter# [  5      � 5      $��10q�6   .+�5      �� -   5        $��YTextBox��5   R   ��6   �� *Y+$ PropertyChanged=�6R   �� 5      $��Enter Y Coordinate��6   
�������$ False��6H   $��Center=�5      $
��Left=�67   $��5,0,0,0q�6R   y�5      �� *Text+$ YTextBox��# [  5      �� 5      $��Submit��6   $��10q�6H   ��6&   �� *SubmitCommand+6H   �� 5      
���  ��$��10q�6K   ��6   �� *ValidationErrors+6K   5      �� 5   
   -   5         ��Name$ CoordinateCanvas��5   5   $��1��6   
�������.+�5      �� 	 �� X1$ 0��6   
���   �$��2��5      	 �� Y1 5      �� *ActualHeight+$ CoordinateCanvas��  HalfHeightConverter# [ 		 �� X2	 5      �� *ActualWidth+$ CoordinateCanvas��	
 �� Y2
 6D   �� *ActualHeight+$ CoordinateCanvas��# [ 5      �� 5!      $ 0��6{   
���   �$��2��5#       5!      �� *ActualWidth+$ CoordinateCanvas��  HalfWidthConverter# [ 	 5"      �� *ActualWidth+$ CoordinateCanvas��# [ 
 6s   �� *ActualHeight+$ CoordinateCanvas��5#      �� 5&      -   5         ��Name$ ConnectingLine��5&      
����  �$��2��5+       5'      �� *X+  CoordinateToArrowXConverter# [  5(      �� *Y+  CoordinateToArrowYConverter# [ 	 5)      �� *X+$ XTextBox��# [ 
 5*      �� *Y+$ YTextBox��# [ 5+      A� 5.      
���  ��$��10��6!   $��10��6,    �� Left 5/      �� *X+# [ 
 �� Top 50      �� *Y+# [ A� 51      
���  ��$��10��6!   $��10��6,    52      �� *X+$ XTextBox��# [  53      �� *Y+$ YTextBox��# [ 54      57      58      