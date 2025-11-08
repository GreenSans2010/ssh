import os, time

print('обновления')
os.system( 'sudo apt update')

time.sleep(1)
print('устоновка openssh-server')
os.system('sudo apt install openssh-server')


