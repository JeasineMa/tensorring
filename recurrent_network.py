'''
A Reccurent Neural Network (LSTM) implementation example using TensorFlow library.
This example is using the MNIST database of handwritten digits (http://yann.lecun.com/exdb/mnist/)
Long Short Term Memory paper: http://deeplearning.cs.cmu.edu/pdfs/Hochreiter97_lstm.pdf

Author: Aymeric Damien
Project: https://github.com/aymericdamien/TensorFlow-Examples/
'''
import time
import random
def qtdata(input):
    output=[]
    for temp in input:
        temp=round(temp,1)
        output.append(temp)
    return output

# Import Data 
def datainput():
    myfile=open("data_out3",'r')
    file2=open("ABCDE-433",'r')
    label=[]
    data=[]
    testing=[]
    for i in range(0,200):
        line=myfile.readline()
        label.append(int(line))
        for j in range(0,12):
            result=[]
            line=myfile.readline()
            temp=map(float,line.split(' ')[0:25])
            result.append(qtdata(temp))

            for num in result:
                data.append(num)

    for j in range(0,6):
        result=[]
        line=file2.readline()
        temp=map(float,line.split(' ')[0:433])
        result.append(temp)

        for num in result:
            testing.append(num)
    return label,data,testing


label,data,testing=datainput()

import tensorflow as tf
from tensorflow.models.rnn import rnn, rnn_cell
import numpy as np

'''
To classify images using a reccurent neural network, we consider every image row as a sequence of pixels.
Because MNIST image shape is 28*28px, we will then handle 28 sequences of 28 steps for every sample.
'''

# Parameters
learning_rate = 0.0001
training_iters = 100000
batch_size = 1
display_step = 5

# Network Parameters
n_input = 6 # MNIST data input (img shape: 28*28)
n_steps = 25# timesteps
n_hidden = 256 # hidden layer num of features
n_classes = 5 # MNIST total classes (0-9 digits)

# tf Graph input
x = tf.placeholder("float", [None, n_steps, n_input])
# Tensorflow LSTM cell requires 2x n_hidden length (state & cell)
istate = tf.placeholder("float", [None, 2*n_hidden])
y = tf.placeholder("float", [None, n_classes])

# Define weights
weights = {
    'hidden': tf.Variable(tf.random_normal([n_input, n_hidden])), # Hidden layer weights
    'out': tf.Variable(tf.random_normal([n_hidden, n_classes]))
}
biases = {
    'hidden': tf.Variable(tf.random_normal([n_hidden])),
    'out': tf.Variable(tf.random_normal([n_classes]))
}

def RNN(_X, _istate, _weights, _biases):

    # input shape: (batch_size, n_steps, n_input)
    _X = tf.transpose(_X, [1, 0, 2])  # permute n_steps and batch_size
    # Reshape to prepare input to hidden activation
    _X = tf.reshape(_X, [-1, n_input]) # (n_steps*batch_size, n_input)
    # Linear activation
    _X = tf.matmul(_X, _weights['hidden']) + _biases['hidden']

    # Define a lstm cell with tensorflow
    lstm_cell = rnn_cell.BasicLSTMCell(n_hidden, forget_bias=1.0)
    # Split data because rnn cell needs a list of inputs for the RNN inner loop
    _X = tf.split(0, n_steps, _X) # n_steps * (batch_size, n_hidden)

    # Get lstm cell output
    outputs, states = rnn.rnn(lstm_cell, _X, initial_state=_istate)

    # Linear activation
    # Get inner loop last output
    return tf.matmul(outputs[-1], _weights['out']) + _biases['out']

pred = RNN(x, istate, weights, biases)

# Define loss and optimizer
cost = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(pred, y)) # Softmax loss
optimizer = tf.train.AdamOptimizer(learning_rate=learning_rate).minimize(cost) # Adam Optimizer

# Evaluate model
correct_pred = tf.equal(tf.argmax(pred,1), tf.argmax(y,1))
accuracy = tf.reduce_mean(tf.cast(correct_pred, tf.float32))

# Initializing the variables
init = tf.initialize_all_variables()

# Launch the graph
with tf.Session() as sess:
    sess.run(init)
    step = 0
    # Keep training until reach max iterations
    while step <160:
        batch_xs=[]
        batch_ys =[]
        for i in range(0,1):
            temp=data[step*12:6+step*12]
            temp=map(list,zip(*temp))
            batch_xs.append(temp)

        #batch_ys.append([label[step]])
            tempp=[]
            for m in range(1,6):
                if m==label[step]:
                    tempp.append(1)
                else:
                    tempp.append(0)
            batch_ys.append(tempp)
        # Reshape data to get 28 seq of 28 elements
        
        # Fit training using batch data
            step += 1

        sess.run(optimizer, feed_dict={x: batch_xs, y: batch_ys,
                                       istate: np.zeros((batch_size, 2*n_hidden))})
        

        loss = sess.run(cost, feed_dict={x: batch_xs, y: batch_ys,
                                             istate: np.zeros((batch_size, 2*n_hidden))})
            # Calculate batch accuracy
        acc = sess.run(accuracy, feed_dict={x: batch_xs, y: batch_ys,
                                                istate: np.zeros((batch_size, 2*n_hidden))})
            # Calculate batch loss
        print "Iter " + str(step*batch_size) + ", Minibatch Loss= " + "{:.6f}".format(loss) + \
                  ", Training Accuracy= " + "{:.5f}".format(acc)
        print "Optimization Finished!"

    # Calculate accuracy for 256 mnist test images
    test_len = 40
    test_data = []
    test_label=[]

    for i in range(160,200):
        temp=data[i*12:(i)*12+6]
        temp=map(list,zip(*temp))
        test_data.append(temp)
        tempp=[]
        for m in range(1,6):
            if m==label[i]:
                tempp.append(1)
            else:
                tempp.append(0)
        test_label.append(tempp)

    begin=time.clock()
    print "Testing Accuracy:", sess.run(accuracy, feed_dict={x: test_data, y: test_label,
                                                             istate: np.zeros((test_len, 2*n_hidden))})
    end=time.clock()
    print 'Time cost:', (end-begin)/10