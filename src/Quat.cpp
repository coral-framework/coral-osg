#include "Quat_Adapter.h"
#include <cstdio>

namespace coOsg
{
	double Quat_Adapter::getW( coOsg::Quat& instance )
	{
		return instance.w();
	}

	void Quat_Adapter::setW( coOsg::Quat& instance, double value )
	{
		instance.w() = value;
	}

	double Quat_Adapter::getX( coOsg::Quat& instance )
	{
		return instance.x();
	}

	void Quat_Adapter::setX( coOsg::Quat& instance, double value )
	{
		instance.x() = value;
	}

	double Quat_Adapter::getY( coOsg::Quat& instance )
	{
		return instance.y();
	}

	void Quat_Adapter::setY( coOsg::Quat& instance, double value )
	{
		instance.y() = value;
	}

	double Quat_Adapter::getZ( coOsg::Quat& instance )
	{
		return instance.z();
	}

	void Quat_Adapter::setZ( coOsg::Quat& instance, double value )
	{
		instance.z() = value;
	}

	void Quat_Adapter::fromMatrix( coOsg::Quat& instance, const coOsg::Matrix& matrix )
	{
		instance.set( matrix );
	}

	void Quat_Adapter::getRotate( coOsg::Quat& instance, double& angle, coOsg::Vec3& axis )
	{
		instance.getRotate( angle, axis );
	}

	void Quat_Adapter::makeRotate( coOsg::Quat& instance, double radians, double x, double y, double z )
	{
		instance.makeRotate( radians, x, y, z );
	}

	void Quat_Adapter::makeRotateFromTo( coOsg::Quat& instance, double x0, double y0, double z0, double x1, double y1, double z1 )
	{
		instance.makeRotate( osg::Vec3d( x0, y0, z0 ), osg::Vec3d( x1, y1, z1 ) );
	}

	void Quat_Adapter::postMult( coOsg::Quat& instance, const coOsg::Quat& other )
	{
		instance = other * instance;
	}

	void Quat_Adapter::preMult( coOsg::Quat& instance, const coOsg::Quat& other )
	{
		instance *= other;
	}

	void Quat_Adapter::slerp( coOsg::Quat& instance, double t, const coOsg::Quat& from, const coOsg::Quat& to )
	{
		instance.slerp( t, from, to );
	}

	void Quat_Adapter::toMatrix( coOsg::Quat& instance, coOsg::Matrix& matrix )
	{
		instance.get( matrix );
	}

	void Quat_Adapter::zeroRotation( coOsg::Quat& instance )
	{
		instance.zeroRotation();
	}
} // namespace coOsg
