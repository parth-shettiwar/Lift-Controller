library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lift is
    Port ( F0 : in  STD_LOGIC_VECTOR (1 downto 0);
           F1 : in  STD_LOGIC_VECTOR (1 downto 0);
           F2 : in  STD_LOGIC_VECTOR (1 downto 0);
           F3 : in  STD_LOGIC_VECTOR (1 downto 0);
           F4 : in  STD_LOGIC_VECTOR (1 downto 0);
           r : in STD_LOGIC;
			  clk : in STD_LOGIC;
           force: in STD_LOGIC_VECTOR(0 downto 0);
           inside : in  STD_LOGIC_VECTOR (4 downto 0);
         
           floor : out  STD_LOGIC_VECTOR (4 downto 0));
end lift;

architecture Behavioral of lift is
type state is (IDLE, UP , DOWN, OPENS, CLOSES);
signal nstate_sig : state := IDLE;
signal temp : std_logic_vector(4 downto 0) := "00001";
signal flr_sig : std_logic_vector(4 downto 0) :="00001";

signal pstate : state :=IDLE; 
--signal up, down : std_logic := '0';
signal direction: std_logic_vector(1 downto 0);
signal dummy: std_logic_vector(1 downto 0);
signal res: std_logic_vector(4 downto 0);
component distance is
   port (p1 : in  STD_LOGIC_VECTOR (4 downto 0);
				p2 : in  STD_LOGIC_VECTOR (4 downto 0);
				p3 : in  STD_LOGIC_VECTOR (4 downto 0);
				h:in std_logic_vector(1 downto 0);	
					
           Lift:in std_logic_vector(4 downto 0);
            dir:out std_logic_vector(1 downto 0);
			  floor:out std_logic_vector(4 downto 0));
  end component distance;
  
component RSHIFT is 
	port (A: in std_logic_vector(4 downto 0) ; S: out std_logic_vector(4 downto 0));
	end component RSHIFT;
	
component LSHIFT is 
	port (A: in std_logic_vector(4 downto 0) ; S: out std_logic_vector(4 downto 0));
	end component LSHIFT;	

begin 

one: distance
 port map( p1(0)=>F0(0),p1(1)=>F1(0),p1(2)=>F2(0),p1(3)=>F3(0),p1(4)=>F4(0),
								p2(0)=>F0(1),p2(1)=>F1(1),p2(2)=>F2(1),p2(3)=>F3(1),p2(4)=>F4(1),
								p3(0)=>inside(0),p3(1)=>inside(1),p3(2)=>inside(2),p3(3)=>inside(3),p3(4)=>inside(4),
								h=>dummy,
								Lift=>temp,
								floor=> res,
								dir=>direction);

process(F0,F1,F2,F3,F4,clk,force,inside,temp,nstate_sig)	
variable nstate : state := IDLE;
	variable flr : std_logic_vector(4 downto 0) := "00001";						
begin
nstate:=nstate_sig;
--if((state=IDLE) or (state = UP) or (state = DOWN)) then


--end if;

case flr is 
	when "00001" =>
		case pstate is 
		when IDLE =>
		
		
		if (direction = "10") then
		nstate :=UP;
		else
			if(force = "0") then
		nstate := IDLE;
		else nstate :=OPENS;
		end if;
		end if;	
			
		when DOWN =>
		nstate := OPENS;
		
		when OPENS =>
			if(force = "1") then
				nstate := OPENS;
			else 
				nstate := CLOSES;
			end if;
		when CLOSES =>
			if(force = "1") then
				nstate :=OPENS;
			else 
				nstate := IDLE;
				end if;
			when UP=>
				if(res="00001") then
					nstate := OPENS;
				else 
				
flr(4) := temp(3);
	flr(3) := temp(2); 
	flr(2) := temp(1);
	flr(1) := temp(0); 
	flr(0) := '0'; 				--	flr := flr+1;
					nstate := UP;
					end if;
	end case;		

	when "00010" =>
		case pstate is
		when IDLE =>
		if (direction = "01") then
		nstate := DOWN;
		elsif (direction = "10") then
		nstate :=UP;
		elsif(direction = "00")then
			if(force = "0") then
		nstate := IDLE;
		else nstate :=OPENS;
		end if;
		end if;
		
		when OPENS =>
		if( force = "1") then
			nstate := OPENS;
		else 
			nstate:=CLOSES;
		end if;
	
		when CLOSES =>
		if( force ="1") then
			nstate := OPENS;
		else 
			nstate := IDLE;
		end if;
			
		when UP =>
			if( res="00010") then
				nstate := OPENS;
			else 	
				nstate := UP;
				--la1: LSHIFT port map ( A=>floor, S=>flr);
				
flr(4) := temp(3);
	flr(3) := temp(2); 
	flr(2) := temp(1);
	flr(1) := temp(0); 
	flr(0) := '0'; 					
				--flr :=flr+1;
			end if;	
		when DOWN =>
			if(res = "00010") then
				nstate := OPENS;
			else 
				nstate := DOWN;
				
	
				flr(4) := '0' ;
	flr(3) := temp(4);
	flr(2) := temp(3);
	flr(1) := temp(2);
	flr(0) := temp(1);
				--flr: flr-1;
			end if;
		end case;
		
		
		
		
	when "00100" =>
		case pstate is
		when IDLE =>
		if (direction = "01") then
		nstate := DOWN;
		elsif (direction = "10") then
		nstate :=UP;
		elsif(direction = "00") then
			if(force = "0") then
		nstate := IDLE;
		else nstate :=OPENS;
		end if;
		end if;
		
		when OPENS =>
		if( force = "1") then
			nstate := OPENS;
		else 
			nstate:=CLOSES;
		end if;
	
		when CLOSES =>
		if( force = "1") then
			nstate := OPENS;
		else 
			nstate := IDLE;
		end if;
			
		when UP =>
			if( res="00100") then
				nstate := OPENS;
			else 	
				nstate := UP;
		--la2: LSHIFT port map ( A=>floor, S=>flr);

flr(4) := temp(3);
	flr(3) := temp(2); 
	flr(2) := temp(1);
	flr(1) := temp(0); 
	flr(0) := '0'; 				
			--flr :=flr+1;
			end if;	
		when DOWN =>
			if(res = "00100") then
				nstate := OPENS;
			else 
				nstate := DOWN;
				
	
				flr(4) := '0' ;
	flr(3) := temp(4);
	flr(2) := temp(3);
	flr(1) := temp(2);
	flr(0) := temp(1);
				--flr: flr-1;
			end if;
		end case;
		
		
		
		
	when "01000" =>
		case pstate is
		when IDLE =>
		if (direction = "01") then
		nstate := DOWN;
		elsif (direction = "10") then
		nstate :=UP;
		elsif(direction = "00") then
			if(force = "0") then
		nstate := IDLE;
		else nstate :=OPENS;
		end if;
		end if;
		
		when OPENS =>
		if( force = "1") then
			nstate := OPENS;
		else 
			nstate:=CLOSES;
		end if;
	
		when CLOSES =>
		if( force = "1") then
			nstate := OPENS;
		else 
			nstate := IDLE;
		end if;
			
		when UP =>
			if( res="01000") then
				nstate := OPENS;
			else 	
				nstate := UP;
			
flr(4) := temp(3);
	flr(3) := temp(2); 
	flr(2) := temp(1);
	flr(1) := temp(0); 
	flr(0) := '0'; 	 				
		
				--flr :=flr+1;
			end if;	
		when DOWN =>
			if(res = "01000") then
				nstate := OPENS;
			else 
				nstate := DOWN;
			
	
				flr(4) := '0' ;
	flr(3) := temp(4);
	flr(2) := temp(3);
	flr(1) := temp(2);
	flr(0) := temp(1);
				--flr: flr-1;
			end if;
		end case;
		
		
		
		
	when "10000" =>
		case pstate is
		when IDLE =>
		if (direction = "01") then
		nstate := DOWN;
		else
			if(force = "0") then
		nstate := IDLE;
		else nstate :=OPENS;
		end if;
		end if;
		
		when OPENS =>
		if( force = "1") then
			nstate := OPENS;
		else 
			nstate:=CLOSES;
		end if;
	
		when CLOSES =>
		if( force = "1") then
			nstate := OPENS;
		else 
			nstate := IDLE;
		end if;
			
		when UP =>
			
				nstate := OPENS;
					
		when DOWN =>
			if(res = "10000") then
				nstate := OPENS;
			else 
				nstate := DOWN;
			
				flr(4) := '0' ;
	flr(3) := temp(4);
	flr(2) := temp(3);
	flr(1) := temp(2);
	flr(0) := temp(1);
				--flr: flr-1;
			end if;
		end case;
		when others =>
		NULL;
	end case;	
	floor <= flr;
	
	 if(clk'event and clk = '1') then
          --if(r = '1') then
           --pstate <= IDLE; nstate := IDLE; flr <= "00001";
          --else
			    pstate <= nstate ;
				 case pstate is
				 when IDLE =>
				 dummy <= "00";
				 when UP =>
				 dummy <= "10";
				 when DOWN =>
				 dummy <= "01";
				 when others =>
		NULL;
				 end case;
			
             temp <= flr; 
				 nstate_sig<=nstate;
          end if;
  end process;
end Behavioral;