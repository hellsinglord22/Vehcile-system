class EtmanVehicleAiController extends AIController;

const NODES_DISTANCE=1600; // approximate distance between every node and the nearst ones to it
const HIDE_TIME= 25; // in seconds
const COLLISION_RADIOUS = 20 ; /// the space between the player and the collision where it stop at 

var array<EtmanPathNode_Traffic> trafficNodes;

var EtmanPathNode_Traffic node;
var EtmanPathNode_Traffic lastVisitedNode;
var Vector newLocation ;
NewLocation += normal(NodeImGoingTo.Location - Location) * 128; // 128 is the distance offset

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    `Log("########__  Controller for vehicle is Here  __########");   
}

event Possess(Pawn aPawn , bool bVehicleTransition)
{
    Super.Possess(aPawn , bVehicleTransition);
 
    //Pawn.SetMovementPhysics();   
   `Log("########__  Pawn -> "@ Pawn @" __########");   
}

event Tick()
{
  /// 1. get destination from the player to the Pawn 
  /// 2. if it's less than 20 unite it goes to state IDLE 
}

 state GettingReady
{
    Begin :
    Sleep(3);
    
    `log("#####__ Now I'm ready to rock and roll ^^ __#####");   
    GotoState('Wandering');
} /// i do shit 

auto state Wandering
{
   Begin:
   sleep(0.8);
   
   trafficNodes.Length = 0;
   foreach VisibleActors(class'EtmanPathNode_Traffic' , node , NODES_DISTANCE  , Pawn.Location )
   {     
       if(!node.Hidden )
       {
           `Log("########__ Taken Node -> "@ node @" __########");  
            trafficNodes.AddItem(node);    
       }    
   }
    if (TrafficNodes.Length != 0)
    {
        node = TrafficNodes[Rand(trafficNodes.Length)];
        
        `Log("########__  Moving to -> "@ node @" __########");   
        MoveTo(node.Location , node); 
        
        node.Hide(HIDE_TIME);
    }
   GoTo('Begin');
}
state IDLE 
{
  /// the bot will stop moving
}


defaultProperties
{
    
    
}