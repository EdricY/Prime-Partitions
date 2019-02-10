with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Containers.Vectors;
use  Ada.Containers;

procedure PrimePartitions 
is
  package Value_Functions is new Ada.Numerics.Generic_Elementary_Functions (Float);
  use Value_Functions;
  package Vector_Pkg is new Vectors (Natural, Integer);
  use     Vector_Pkg;

  function IsPrime (N : Positive) return Boolean is
  begin
    if N <= 1 then
      return False;
    end if;
    for I in 2 .. (Integer(Sqrt(Float(N)))) loop
      if (N mod I = 0) then
        return False;
      end if;
    end loop;
    return True;
  end IsPrime;

  function Primes (A, B : Positive) return Vector is
    Vec: Vector;
  begin
    for I in A .. B loop
      if (IsPrime(I)) then
        Vec.append(I);
      end if;
    end loop;
    return Vec;
  end Primes;

  procedure PrimePartitions (N: Natural; K: Positive; Vec: Vector) is
  PrimesVec: Vector;
  CopyVec: Vector;
  begin
    if (N = 0) then
      Put(Integer'Image(Vec(0)));
      for I in 1..Vec.Last_Index loop
        Put(" +" & Integer'Image(Vec(I)));
      end loop;
      Put_Line("");
    elsif (N > K) then
      PrimesVec := Primes((K+1), N);
      for I in 0..PrimesVec.Last_Index loop
        CopyVec := Vec;
        CopyVec.append(PrimesVec(I));
        PrimePartitions(N - PrimesVec(I), PrimesVec(I), CopyVec);
      end loop;
    end if;
  end PrimePartitions;
  
  -- https://www.rosettacode.org/wiki/User_input/Text#Ada
  function Get_String return String is
    Line : String (1 .. 1_000);
    Last : Natural;
  begin
    Get_Line (Line, Last);
    return Line (1 .. Last);
  end Get_String;
 
  function Get_Integer return Integer is
    S : constant String := Get_String;
  begin
    return Integer'Value (S);
    --  may raise exception Constraint_Error if value entered is not a well-formed integer
  end Get_Integer;
  
  V: Vector;
  N: Integer;

begin
  Put("Enter a positive number: ");
  N := Get_Integer;
  PrimePartitions(N, 1, V);

end PrimePartitions;
